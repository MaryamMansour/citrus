import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/CartResponse.dart';

abstract class CartDto {
  Future<Either<Failures, CartResponse>> getCart();

  Future<Either<Failures, CartResponse>> update(String id, int count);

  Future<Either<Failures, CartResponse>> deleteItemOfCart(String id);
}

class RemoteCartDto implements CartDto {
  Dio dio = Dio();
  var token = CacheHelper.getData("User");

  @override
  Future<Either<Failures, CartResponse>> getCart() async {
    try {
      var response = await dio.get(
          "${Constants.baseApiUrl}${EndPoints.addToCart}",
          options: Options(headers: {"token": token}));
      print(response.data);
      print(response.statusCode);
      CartResponse cartResponse = CartResponse.fromJson(response.data);

      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> deleteItemOfCart(String id) async {
    try {
      var response = await dio.delete(
          "${Constants.baseApiUrl}${EndPoints.addToCart}/$id",
          options: Options(headers: {"token": token}));

      CartResponse cartResponse = CartResponse.fromJson(response.data);

      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> update(String id, int count) async {
    try {
      var response = await dio.put(
          "${Constants.baseApiUrl}${EndPoints.addToCart}/$id",
          options: Options(headers: {"token": token}),
          data: {"count": count});

      CartResponse cartResponse = CartResponse.fromJson(response.data);

      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

class LocalCartDto implements CartDto {
  @override
  Future<Either<Failures, CartResponse>> getCart() {
    // TODO: implement getCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponse>> deleteItemOfCart(String id) {
    // TODO: implement deleteItemOfCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponse>> update(String id, int count) {
    // TODO: implement update
    throw UnimplementedError();
  }
}