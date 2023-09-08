import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/ProductEntity.dart';
import '../repositories/home_domain_repo.dart';

class GetProductsUseCase {
  HomeDomainRepo homeDomainRepo;

  GetProductsUseCase(this.homeDomainRepo);

  Future<Either<Failures, ProductEntity>> call() =>
      homeDomainRepo.getProducts();
}