import 'dart:io';

class AddProductInputEntity {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final File image;
  final String? imageUrl;
  final bool isFeatured;

  AddProductInputEntity({
    required this.productName,
    required this.productCode,
    required this.productDescription,
    required this.productPrice,
    required this.image,
    this.imageUrl,
    required this.isFeatured,
  });
}
