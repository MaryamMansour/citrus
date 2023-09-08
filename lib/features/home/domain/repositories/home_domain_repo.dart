import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/CategoriesEntity.dart';

abstract class HomeDomainRepo{


  Future <Either<Failures, CategoryOrBrandEntity>>getCategories();
  Future <Either<Failures, CategoryOrBrandEntity>>getBrands();

}