import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/product/models/product_model.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductByCategoriesId(String categoryId);
  Future<Either> getProductByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoriteProduct();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var query = FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 40);

      var returnedData = await query.get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var query = FirebaseFirestore.instance.collection('Products').where(
          'createdDate',
          isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime(2024, 7, 10)));

      var returnedData = await query.get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getProductByCategoriesId(String categoryId) async {
    try {
      var query = FirebaseFirestore.instance
          .collection('Products')
          .where('categoriesId', isEqualTo: categoryId);

      var returnedData = await query.get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getProductByTitle(String title) async {
    try {
      var query = FirebaseFirestore.instance
          .collection('Products')
          .where('title', isGreaterThanOrEqualTo: title);

      var returnedData = await query.get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var query = FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: product.productId);
      var returnedData = await query.get();
      returnedData;

      if (returnedData.docs.isNotEmpty) {
        await returnedData.docs.first.reference.delete();
        return const Right(false);
      } else {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('Favorites')
            .add(product.fromEntity().toMap());
        return const Right(true);
      }
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<bool> isFavorite(String productId) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var query = FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: productId);
      var returnedData = await query.get();
      returnedData;

      if (returnedData.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavoriteProduct() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var query = FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorites')
          .where('createdDate',
              isGreaterThanOrEqualTo:
                  Timestamp.fromDate(DateTime(2024, 7, 10)));

      var returnedData = await query.get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left(e);
    }
  }
}
