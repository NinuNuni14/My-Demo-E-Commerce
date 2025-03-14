import 'package:e_commerce_project/domain/product/entity/product_entity.dart';

class ProductPriceHelper {
  static double currentPrice(ProductEntity productEntity) {
    return productEntity.discountedPrice != 0
        ? productEntity.discountedPrice.toDouble()
        : productEntity.price.toDouble();
  }
}
