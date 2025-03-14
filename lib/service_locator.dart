import 'package:e_commerce_project/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce_project/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce_project/data/category/repository/category_repository_impl.dart';
import 'package:e_commerce_project/data/category/source/category_firebase_service.dart';
import 'package:e_commerce_project/data/order/repository/order_repository_impl.dart';
import 'package:e_commerce_project/data/order/source/order_firebase_service.dart';
import 'package:e_commerce_project/data/product/repository/product_repository_impl.dart';
import 'package:e_commerce_project/data/product/source/product_firebase_service.dart';
import 'package:e_commerce_project/domain/auth/repository/auth.dart';
import 'package:e_commerce_project/domain/auth/usecase/get_ages.dart';
import 'package:e_commerce_project/domain/auth/usecase/get_user_usecase.dart';
import 'package:e_commerce_project/domain/auth/usecase/is_logged_in_usecase.dart';
import 'package:e_commerce_project/domain/auth/usecase/send_password_reset_email_usecase.dart';
import 'package:e_commerce_project/domain/auth/usecase/signin_usecase.dart';
import 'package:e_commerce_project/domain/auth/usecase/signout_usecase.dart';
import 'package:e_commerce_project/domain/auth/usecase/signup_usecase.dart';
import 'package:e_commerce_project/domain/category/repository/category.dart';
import 'package:e_commerce_project/domain/category/usecase/get_categories_usecase.dart';
import 'package:e_commerce_project/domain/order/repository/order.dart';
import 'package:e_commerce_project/domain/order/usecases/add_to_cart_usecase.dart';
import 'package:e_commerce_project/domain/order/usecases/get_cart_product_usecase.dart';
import 'package:e_commerce_project/domain/order/usecases/get_orders_usecase.dart';
import 'package:e_commerce_project/domain/order/usecases/order_registration_usecase.dart';
import 'package:e_commerce_project/domain/order/usecases/remove_cart_product_usecase.dart';
import 'package:e_commerce_project/domain/product/repository/product.dart';
import 'package:e_commerce_project/domain/product/usecases/add_or_remove_favorite_product_usecase.dart';
import 'package:e_commerce_project/domain/product/usecases/get_favorite_product_usecase.dart';
import 'package:e_commerce_project/domain/product/usecases/get_new_in_usecase.dart';
import 'package:e_commerce_project/domain/product/usecases/get_product_by_categories_id_usecase.dart';
import 'package:e_commerce_project/domain/product/usecases/get_product_by_title_usecase.dart';
import 'package:e_commerce_project/domain/product/usecases/get_top_selling_usecase.dart';
import 'package:e_commerce_project/domain/product/usecases/is_favorite_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());
  sl.registerSingleton<OrderFirebaseService>(OrderFirebaseServiceImpl());

  //Rspositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());
  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl());

  //Usercases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());

  sl.registerSingleton<GetAgesUsecase>(GetAgesUsecase());

  sl.registerSingleton<SigninUsecase>(SigninUsecase());

  sl.registerSingleton<SendPasswordResetEmailUsecase>(
      SendPasswordResetEmailUsecase());

  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());

  sl.registerSingleton<GetUserUsecase>(GetUserUsecase());

  sl.registerSingleton<SignoutUsecase>(SignoutUsecase());

  sl.registerSingleton<GetCategoriesUsecase>(GetCategoriesUsecase());

  sl.registerSingleton<GetTopSellingUsecase>(GetTopSellingUsecase());

  sl.registerSingleton<GetNewInUsecase>(GetNewInUsecase());

  sl.registerSingleton<GetProductByCategoriesIdUsecase>(
      GetProductByCategoriesIdUsecase());

  sl.registerSingleton<GetProductByTitleUsecase>(GetProductByTitleUsecase());

  sl.registerSingleton<AddToCartUsecase>(AddToCartUsecase());

  sl.registerSingleton<GetCartProductUsecase>(GetCartProductUsecase());

  sl.registerSingleton<RemoveCartProductUsecase>(RemoveCartProductUsecase());

  sl.registerSingleton<OrderRegistrationUsecase>(OrderRegistrationUsecase());

  sl.registerSingleton<AddOrRemoveFavoriteProductUsecase>(
      AddOrRemoveFavoriteProductUsecase());

  sl.registerSingleton<IsFavoriteUsecase>(IsFavoriteUsecase());

  sl.registerSingleton<GetFavoriteProductUsecase>(GetFavoriteProductUsecase());

  sl.registerSingleton<GetOrdersUsecase>(GetOrdersUsecase());
}
