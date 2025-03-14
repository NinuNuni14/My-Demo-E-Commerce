import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce_project/data/order/models/order_registration_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddToCartReq addToCartReq);
  Future<Either> getCartProduct();
  Future<Either> removeCartProduct(String id);
  Future<Either> orderRegistration(OrderRegistrationReq order);
  Future<Either> getOrder();
}

class OrderFirebaseServiceImpl implements OrderFirebaseService {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Carts')
          .add(addToCartReq.toMap());
      return const Right('Added to cart successfully');
    } catch (e) {
      return const Left('Failed to add to cart');
    }
  }

  @override
  Future<Either> getCartProduct() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var query = FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Carts');

      var returnedData = await query.get();
      List<Map<String, dynamic>> products = [];
      for (var item in returnedData.docs) {
        var data =
            Map<String, dynamic>.from(item.data()); // Create a new mutable map
        data['id'] = item.id; // Add document ID
        products.add(data);
      }

      if (returnedData.docs.isEmpty) {
        return const Right([]); // Return empty list instead of null
      }
      return Right(
          products); // Return the updated list of products including the 'id'
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var query = FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Carts')
          .doc(id);

      var returnedData = await query.delete();
      returnedData;
      return const Right('Product removed successfully');
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> orderRegistration(order) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var query = FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Orders');

      var returnedData = await query.add(order.toMap());
      returnedData;

      for (var item in order.products) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('Carts')
            .doc(item.id)
            .delete();
      }
      return const Right('Order registered successfully');
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getOrder() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var query = FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Orders');

      var returnedData = await query.get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left(e);
    }
  }
}
