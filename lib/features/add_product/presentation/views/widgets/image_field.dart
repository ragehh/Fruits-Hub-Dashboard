import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImagePicked});

  final ValueChanged<File?> onImagePicked;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          try {
            await pickImage();
          } on Exception catch (e) {
            setState(() {
              isLoading = false;
            });
          }
          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xFFE6E9E9)),
              ),

              child: imageFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(imageFile!),
                    )
                  : Icon(Icons.image_outlined, size: 180),
            ),
            Visibility(
              visible: imageFile != null,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    imageFile = null;
                    widget.onImagePicked(null);
                  });
                },
                icon: Icon(Icons.delete, color: Colors.red, size: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    widget.onImagePicked(imageFile!);
  }
}
