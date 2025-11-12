import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as p;

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(String path, File file) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);
    var fileReference = storageReference.child(
      '$path/$fileName.$extensionName',
    );
    await fileReference.putFile(file);
    var fileUrl = await fileReference.getDownloadURL();
    return fileUrl;
  }
}
