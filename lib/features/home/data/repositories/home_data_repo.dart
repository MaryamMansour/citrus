import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/home/data/models/CartResponse.dart';
import 'package:e_commerce/features/home/domain/entities/CategoriesEntity.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class HomeDataRepo implements HomeDomainRepo{
  HomeDataSources homeDataSources;
  HomeDataRepo(this.homeDataSources);
  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getBrands()=>homeDataSources.getBrands();

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories()=>homeDataSources.getCategories();

  @override
  Future<Either<Failures, ProductEntity>> getProducts() => homeDataSources.getProducts();

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) =>homeDataSources.addToCart( productId);

  }

