import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/helpers/constants.dart';
import 'package:flutter_complete_course/core/helpers/shared_pref_helper.dart';
import 'package:flutter_complete_course/core/networking/api_result.dart';
import 'package:flutter_complete_course/core/networking/dio_factory.dart';
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

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await loginRepo.login(
      LoginRequstBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.userdata?.token ?? '');
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(errorMessage: error.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
