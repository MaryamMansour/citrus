import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/data/models/CartResponse.dart';
import '../../domain/repositories/cart_domai_repo.dart';
import '../data_sources/dto.dart';

class CartDataRepo implements CartDomainRepo {
  CartDto cartDto;

  CartDataRepo(this.cartDto);

  @override
  Future<Either<Failures, CartResponse>> getCart() {
    return cartDto.getCart();
  }

  @override
  Future<Either<Failures, CartResponse>> deleteItemOfCart(String id) {
    return cartDto.deleteItemOfCart(id);
  }

  @override
  Future<Either<Failures, CartResponse>> update(String id, int count) {
    return cartDto.update(id, count);
  }
}