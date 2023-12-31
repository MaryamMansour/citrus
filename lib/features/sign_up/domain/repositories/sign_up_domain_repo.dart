import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/sign_up/domain/entities/user_data.dart';

import '../entities/signUpEntity.dart';

abstract class SignUpDomainRepo{


  Future<Either<Failures,SignUpEntity>>signUp(UserData userData);
}