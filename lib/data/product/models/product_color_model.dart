import 'dart:convert';

import 'package:e_commerce_project/domain/product/entity/product_color_entity.dart';

class ProductColorModel {
  final String title;
  final List<int> rbg;

  ProductColorModel({required this.title, required this.rbg});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'rbg': rbg,
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) {
      throw Exception('Empty map passed to ProductColorModel.fromMap');
    }

    return ProductColorModel(
      title: map['title'] as String? ?? 'Unknown', // Prevent null values
      rbg: List<int>.from(map['rbg'] ?? []), // Prevent null values
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorModel.fromJson(String source) =>
      ProductColorModel.fromJson(source);

  /// ✅ **Add this missing method**
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      rbg: rbg,
    );
  }
}
