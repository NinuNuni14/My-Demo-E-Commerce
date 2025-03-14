import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:e_commerce_project/domain/product/entity/product_color_entity.dart';

class ProductEntity {
  final String categoryId;
  final List<ProductColorEntity> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductEntity(
      {required this.categoryId,
      required this.colors,
      required this.createdDate,
      required this.discountedPrice,
      required this.gender,
      required this.images,
      required this.price,
      required this.sizes,
      required this.productId,
      required this.salesNumber,
      required this.title});

  /// ✅ Convert `ProductEntity` to a map
  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'colors': colors.map((e) => e.toMap()).toList(),
      'createdDate':
          createdDate.millisecondsSinceEpoch, // ✅ Convert Timestamp to int
      'discountedPrice': discountedPrice,
      'gender': gender,
      'images': images,
      'price': price,
      'sizes': sizes,
      'productId': productId,
      'salesNumber': salesNumber,
      'title': title,
    };
  }

  /// ✅ Convert `ProductEntity` to JSON
  String toJson() => jsonEncode(toMap());
}
