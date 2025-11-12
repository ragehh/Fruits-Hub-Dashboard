import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductInputEntity {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final num avgRating = 0;
  final num avgCount = 0;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  final File image;
  String? imageUrl;
  final bool isFeatured;
  final bool isOrganic;
  final List<ReviewEntity> reviews;

  AddProductInputEntity({
    required this.productName,
    required this.productCode,
    required this.productDescription,
    required this.productPrice,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.image,
    this.imageUrl,
    required this.isFeatured,
    this.isOrganic = false,
    required this.reviews,
  });
}
