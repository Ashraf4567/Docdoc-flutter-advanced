
import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/networking/api_service.dart';
import 'package:flutter_advanced/core/networking/auth_interceptor.dart';
import 'package:flutter_advanced/core/networking/dio_factory.dart';
import 'package:flutter_advanced/core/storage/secure_storage.dart';
import 'package:flutter_advanced/features/home/data/repos/home_repo.dart';
import 'package:flutter_advanced/features/home/ui/cubit/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/signup/data/repo/signup_repo.dart';
import 'package:flutter_advanced/features/signup/logic/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  getIt.registerLazySingleton<ISecureStorage>(() => SecureStorageService());
  getIt.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(getIt<ISecureStorage>()));
  Dio dio = DioFactory.getDio(getIt<AuthInterceptor>());
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>(), getIt<ISecureStorage>()));

  //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt<ApiService>()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepo>(), getIt<ISecureStorage>()));

  // Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
}