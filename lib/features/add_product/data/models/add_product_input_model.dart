import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final File image;
  final String? imageUrl;
  final bool isFeatured;

  AddProductInputModel({
    required this.productName,
    required this.productCode,
    required this.productDescription,
    required this.productPrice,
    required this.image,
    this.imageUrl,
    required this.isFeatured,
  });

  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputModel(
      productName: entity.productName,
      productCode: entity.productCode,
      productDescription: entity.productDescription,
      productPrice: entity.productPrice,
      image: entity.image,
      imageUrl: entity.imageUrl,
      isFeatured: entity.isFeatured,
    );
  }

  toJSon() {
    return {
      "productName": productName,
      "productCode": productCode,
      "productDescription": productDescription,
      "productPrice": productPrice,
      "image": image,
      "imageUrl": imageUrl,
      "isFeatured": isFeatured,
    };
  }
}
