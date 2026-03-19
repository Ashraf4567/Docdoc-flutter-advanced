import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/storage/secure_storage.dart';
import 'package:flutter_advanced/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final ISecureStorage _secureStorage;
  LoginCubit(this._loginRepo, this._secureStorage) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(
      emailController.text,
      passwordController.text,
    );
    response.when(success: (loginResponse) {
      final token = loginResponse.userData?.token;
      if (token != null) {
        _secureStorage.saveToken(token);
      }
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error.apiErrorModel.message ?? ''));
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
