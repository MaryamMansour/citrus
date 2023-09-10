import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/home_domain_repo.dart';


class AddCartUseCase {
  HomeDomainRepo homeDomainRepo;

  AddCartUseCase(this.homeDomainRepo);

  Future<Either<Failures, CartResponse>> call(String productId) =>
      homeDomainRepo.addToCart(productId);
}