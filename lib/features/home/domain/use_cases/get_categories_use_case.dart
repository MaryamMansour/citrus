import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';

import '../entities/CategoriesEntity.dart';
import '../repositories/home_domain_repo.dart';

class GetCategoriesUseCase{
  HomeDomainRepo homeDomainRepo;
  GetCategoriesUseCase(this.homeDomainRepo);
  Future<Either<Failures,CategoryOrBrandEntity >>call()=>
      homeDomainRepo.getCategories();
}