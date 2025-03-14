import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/product/models/product_model.dart';
import 'package:e_commerce_project/data/product/source/product_firebase_service.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:e_commerce_project/domain/product/repository/product.dart';
import 'package:e_commerce_project/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var returnedData = await sl<ProductFirebaseService>().getTopSelling();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        var productList = (data as List<dynamic>).map((e) {
          var product =
              ProductModel.fromMap(e as Map<String, dynamic>).toEntity();
          return product;
        }).toList();

        return Right(productList);
      } catch (e) {
        return Left(e);
      }
    });
  }

  @override
  Future<Either> getNewIn() async {
    var returnedData = await sl<ProductFirebaseService>().getNewIn();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        var productList = (data as List<dynamic>).map((e) {
          var product =
              ProductModel.fromMap(e as Map<String, dynamic>).toEntity();

          return product;
        }).toList();
        return Right(productList);
      } catch (e) {
        return Left(e);
      }
    });
  }

  @override
  Future<Either> getProductByCategoriesId(String categoryId) async {
    var returnedData =
        await sl<ProductFirebaseService>().getProductByCategoriesId(categoryId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        var productList = (data as List<dynamic>).map((e) {
          var product =
              ProductModel.fromMap(e as Map<String, dynamic>).toEntity();

          return product;
        }).toList();
        return Right(productList);
      } catch (e) {
        return Left(e);
      }
    });
  }

  @override
  Future<Either> getProductByTitle(String title) async {
    var returnedData =
        await sl<ProductFirebaseService>().getProductByTitle(title);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        var productList = (data as List<dynamic>).map((e) {
          var product =
              ProductModel.fromMap(e as Map<String, dynamic>).toEntity();

          return product;
        }).toList();
        return Right(productList);
      } catch (e) {
        return Left(e);
      }
    });
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
    var returnedData =
        await sl<ProductFirebaseService>().addOrRemoveFavoriteProduct(product);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }

  @override
  Future<bool> isFavorite(String productId) async {
    return sl<ProductFirebaseService>().isFavorite(productId);
  }

  @override
  Future<Either> getFavoriteProduct() async {
    var returnedData = await sl<ProductFirebaseService>().getFavoriteProduct();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        var productList = (data as List<dynamic>).map((e) {
          var product =
              ProductModel.fromMap(e as Map<String, dynamic>).toEntity();

          return product;
        }).toList();
        return Right(productList);
      } catch (e) {
        return Left(e);
      }
    });
  }
}
