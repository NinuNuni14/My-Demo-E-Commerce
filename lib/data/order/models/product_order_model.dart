import 'package:e_commerce_project/domain/order/entity/product_order_entity.dart';

class ProductOrderModel {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;
  final String id;

  ProductOrderModel({
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createdDate,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productColor': productColor,
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createdDate': createdDate,
      'id': id,
    };
  }

  factory ProductOrderModel.fromMap(Map<String, dynamic> map) {
    try {
      return ProductOrderModel(
        productId: map['productId'] as String? ?? "UNKNOWN_ID",
        productTitle: map['productTitle'] as String? ?? "UNKNOWN_TITLE",
        productQuantity: (map['productQuantity'] as num?)?.toInt() ?? 0,
        productColor: map['productColor'] as String? ?? "UNKNOWN_COLOR",
        productSize: map['productSize'] as String? ?? "UNKNOWN_SIZE",
        productPrice: (map['productPrice'] as num?)?.toDouble() ?? 0.0,
        totalPrice: (map['totalPrice'] as num?)?.toDouble() ?? 0.0,
        productImage: map['productImage'] as String? ?? "UNKNOWN_IMAGE",
        createdDate: map['createdDate'] as String? ?? "UNKNOWN_DATE",
        id: map['id'] as String? ?? "UNKNOWN_ID",
      );
    } catch (e) {
      throw Exception("Data conversion error: $e");
    }
  }
}

extension ProductOrderXModel on ProductOrderModel {
  ProductOrderEntity toEntity() {
    return ProductOrderEntity(
        productId: productId,
        productTitle: productTitle,
        productQuantity: productQuantity,
        productColor: productColor,
        productSize: productSize,
        productPrice: productPrice,
        totalPrice: totalPrice,
        productImage: productImage,
        createdDate: createdDate,
        id: id);
  }
}

extension ProductOrderXEntity on ProductOrderEntity {
  ProductOrderModel fromEntity() {
    return ProductOrderModel(
        productId: productId,
        productTitle: productTitle,
        productQuantity: productQuantity,
        productColor: productColor,
        productSize: productSize,
        productPrice: productPrice,
        totalPrice: totalPrice,
        productImage: productImage,
        createdDate: createdDate,
        id: id);
  }
}
