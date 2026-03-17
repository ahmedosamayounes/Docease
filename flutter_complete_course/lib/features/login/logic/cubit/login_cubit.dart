import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/networking/api_result.dart';
import 'package:flutter_complete_course/features/login/data/models/login_requst_body.dart';
import 'package:flutter_complete_course/features/login/data/models/login_response.dart';
import 'package:flutter_complete_course/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_course/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  void emitLoginStates(LoginRequstBody loginRequstBody) async {
    emit(const LoginState.loading());
    final response = await loginRepo.login(loginRequstBody);

    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(errorMessage: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
