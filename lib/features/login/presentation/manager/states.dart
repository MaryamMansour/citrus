import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/sign_up/domain/entities/signUpEntity.dart';

import '../../domain/entities/login_entity.dart';

abstract class LoginStates{

}
class LoginInitState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  LoginEntity loginEntity;
  LoginSuccessState( this.loginEntity) ;
}
class LoginErrorState extends LoginStates{
  Failures failures;
  LoginErrorState(this.failures);
}
