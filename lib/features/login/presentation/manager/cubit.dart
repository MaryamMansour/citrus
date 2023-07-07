

import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/login/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sign_up/domain/entities/user_data.dart';
import '../../data/data_sources/data_sources.dart';
import '../../data/repositories/login_data_repo.dart';
import '../../domain/repositories/login_domain_repo.dart';
import '../../domain/use_cases/login_use_case.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginDataSources sources;

  LoginCubit(this.sources) : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);


  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void login() async{
    emit(LoginLoadingState());
    LoginDomainRepo signUpDomainRepo = LoginDataRepo(sources);
    LoginUseCase signUpUseCase = LoginUseCase(signUpDomainRepo);


    var result = await signUpUseCase.call( emailController.text,passwordController.text);
    result.fold((l) {
      emit(LoginErrorState(l));
    }, (r) {
      emit(LoginSuccessState(r));
    });
  }
}
