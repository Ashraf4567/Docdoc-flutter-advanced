import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(String email, String password) async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(email, password);
    response.when(success: (loginResponse) {
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error.apiErrorModel.message ?? ''));
    });
  }

  @override
  Future<void> close() {
    // Dispose controllers here — the Cubit owns them, so it cleans them up.
    // This is called automatically by BlocProvider when the Cubit leaves the tree.
    // Same concept as ViewModel.onCleared() in Android.
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
