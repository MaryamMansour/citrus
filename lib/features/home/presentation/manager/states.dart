import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/models/CategoryOrBrandModel.dart';
import 'package:e_commerce/features/home/domain/entities/CategoriesEntity.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';

import '../../data/models/CartResponse.dart';

abstract class HomeStates{
}

class HomeInitState extends HomeStates{}
class HomeLoadingState extends HomeStates{}
class HomeGetBrandsSuccessState extends HomeStates{
  CategoryOrBrandEntity model;
  HomeGetBrandsSuccessState(this.model);
}
class HomeGetCategoriesSuccessState extends HomeStates{
  CategoryOrBrandEntity model;
  HomeGetCategoriesSuccessState(this.model);
}
class HomeGetBrandsErrorState extends HomeStates{
  Failures failures;
  HomeGetBrandsErrorState(this.failures);
}
class HomeGetCategoriesErrorState extends HomeStates{
  Failures failures;
  HomeGetCategoriesErrorState(this.failures);
}
class ChangeBottomNavBar extends HomeStates{}

class HomeGetProductsSuccessState extends HomeStates{
  ProductEntity model;
  HomeGetProductsSuccessState(this.model);
}
class HomeGetProductsErrorState extends HomeStates{
  Failures failures;
  HomeGetProductsErrorState(this.failures);
}
class AddToCartLoadingState extends HomeStates {}

class AddToCartSuccessState extends HomeStates {
  CartResponse cartResponse;

  AddToCartSuccessState(this.cartResponse);
}

class AddToCartErrorState extends HomeStates {
  Failures failures;

  AddToCartErrorState(this.failures);
}
