import 'package:e_commerce_project/data/product/models/product_color_model.dart';

class ProductColorEntity {
  final String title;
  final List<int> rbg;

  ProductColorEntity({
    required this.title,
    required this.rbg,
  });

  /// ✅ Convert `ProductColorEntity` to a map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'rbg': rbg,
    };
  }

  ProductColorModel fromEntity() {
    return ProductColorModel(
      title: title,
      rbg: rbg,
    );
  }
}
