import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

import '../entities/CategoriesEntity.dart';

class GetBrandsUseCase{
  HomeDomainRepo homeDomainRepo;
  GetBrandsUseCase(this.homeDomainRepo);
  Future<Either<Failures,CategoryOrBrandEntity>>call()=>homeDomainRepo.getBrands();
}