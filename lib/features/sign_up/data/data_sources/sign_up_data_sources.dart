

import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/sign_up/data/models/SignUpModel.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user_data.dart';

abstract class SignUpDataSources{

  Future<Either<Failures, SignUpModel>> signUp(UserData userData);
}