import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/data/product/models/product_color_model.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';

class ProductModel {
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductModel(
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

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    var colorsData = map['colors'];
    return ProductModel(
      categoryId: map['categoryId'] as String? ?? '',
      colors: (colorsData is List)
          ? colorsData.map((e) {
              if (e is Map<String, dynamic>) {
                return ProductColorModel.fromMap(e);
              } else {
                throw Exception('Invalid color format: $e');
              }
            }).toList()
          : [],
      createdDate: map['createdDate'] as Timestamp? ?? Timestamp.now(),
      discountedPrice: map['discountedPrice'] as num? ?? 0,
      gender: map['gender'] as int? ?? 0,
      images: List<String>.from(map['images'] ?? []),
      price: map['price'] as num? ?? 0,
      sizes:
          (map['sizes'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
              [],
      productId: map['productId'] as String? ?? '',
      salesNumber: map['salesNumber'] as int? ?? 0,
      title: map['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'colors': colors.map((e) => e.toMap()).toList(),
      'createdDate': createdDate,
      'discountedPrice': discountedPrice,
      'gender': gender,
      'images': images.map((e) => e.toString()).toList(),
      'price': price,
      'sizes': sizes.map((e) => e.toString()).toList(),
      'productId': productId,
      'salesNumber': salesNumber,
      'title': title,
    };
  }
}

extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
        categoryId: categoryId,
        colors: colors.map((e) => e.fromEntity()).toList(),
        createdDate: createdDate,
        discountedPrice: discountedPrice,
        gender: gender,
        images: images,
        price: price,
        sizes: sizes,
        productId: productId,
        salesNumber: salesNumber,
        title: title);
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
        categoryId: categoryId,
        colors: colors.map((e) => e.toEntity()).toList(),
        createdDate: createdDate,
        discountedPrice: discountedPrice,
        gender: gender,
        images: images,
        price: price,
        sizes: sizes,
        productId: productId,
        salesNumber: salesNumber,
        title: title);
  }
}
