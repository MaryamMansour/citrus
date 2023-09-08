import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/utils/constants.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/CategoriesEntity.dart';
import '../models/CategoryOrBrandModel.dart';

abstract class HomeDataSources{
  Future<Either<Failures, CategoryOrBrandModel>>  getBrands();
  Future<Either<Failures, CategoryOrBrandModel>> getCategories();
}

class HomeRemoteDto implements HomeDataSources{
  Dio dio = Dio();
  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() async {
    
    try {
      var response = await dio.get("${Constants.baseApiUrl}${EndPoints.getAllBrands}",);
      CategoryOrBrandModel model= CategoryOrBrandModel.fromJson(response.data);    
    return Right(model);
    }
    catch(e)
    {
      return Left(ServerFailures(e.toString()));

    }

  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() async {
    try {
      var response = await dio.get("${Constants.baseApiUrl}${EndPoints.getAllCategories}",);
      CategoryOrBrandModel model= CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    }
    catch(e)
    {
      return Left(ServerFailures(e.toString()));

    }
  }

}
class HomeLocalDto implements HomeDataSources{
  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

}