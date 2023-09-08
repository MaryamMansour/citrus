import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/models/CategoryOrBrandModel.dart';
import 'package:e_commerce/features/home/domain/entities/CategoriesEntity.dart';

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