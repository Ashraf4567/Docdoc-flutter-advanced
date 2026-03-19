import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/core/storage/secure_storage.dart';
import 'package:flutter_advanced/features/signup/data/models/signup_request_body.dart';
import 'package:flutter_advanced/features/signup/data/repo/signup_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  final ISecureStorage _secureStorage;

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  Gender selectedGender = Gender.male;

  SignupCubit(this._signupRepo, this._secureStorage) : super(SignupState.initial());

  Future<void> emitSignupStates() async {
    emit(SignupState.loading());
    final result = await _signupRepo.signup(
      nameController.text,
      emailController.text,
      passwordController.text,
      passwordConfirmationController.text,
      phoneController.text,
      selectedGender,
    );
    result.when(
        success: (success) {
          final token = success.userData?.token;
          if (token != null) {
            _secureStorage.saveToken(token);
          }
          emit(SignupState.success(success));
        },
        failure: (failure) =>
            emit(SignupState.error(failure.apiErrorModel.message ?? '')));
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    return super.close();
  }
}
