import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/models/CartResponse.dart';
import 'package:e_commerce/features/home/domain/entities/CategoriesEntity.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';

abstract class HomeDomainRepo{


  Future <Either<Failures, CategoryOrBrandEntity>>getCategories();
  Future <Either<Failures, CategoryOrBrandEntity>>getBrands();
  Future <Either<Failures, ProductEntity>>getProducts();

  Future <Either<Failures, CartResponse>>addToCart(String productId);

}