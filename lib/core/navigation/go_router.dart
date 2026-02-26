import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/features/home/presentation/home_screen.dart';
import 'package:flutter_advanced/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/presentation/login_screen.dart';
import 'package:flutter_advanced/features/onboarding/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(routes: [
  GoRoute(
    path: '/home',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/',
    builder: (context, state) => OnboardingScreen(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepo>()),
      child: LoginScreen(),
    ),
  ),
]);
