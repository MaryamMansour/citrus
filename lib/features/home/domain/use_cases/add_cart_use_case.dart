import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/AddCartResponse.dart';
import '../../data/models/CartResponse.dart';
import '../repositories/home_domain_repo.dart';


class AddCartUseCase {
  HomeDomainRepo homeDomainRepo;

  AddCartUseCase(this.homeDomainRepo);

  Future<Either<Failures, AddCartResponse>> call(String productId) =>
      homeDomainRepo.addToCart(productId);
}