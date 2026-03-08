import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/navigation/routes.dart';
import 'package:flutter_advanced/features/home/presentation/home_screen.dart';
import 'package:flutter_advanced/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/presentation/login_screen.dart';
import 'package:flutter_advanced/features/onboarding/onboarding_screen.dart';
import 'package:flutter_advanced/features/signup/data/repo/signup_repo.dart';
import 'package:flutter_advanced/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter_advanced/features/signup/ui/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: Routes.home,
  routes: [

  GoRoute(
    path: Routes.onboarding,
    builder: (context, state) => OnboardingScreen(),
  ),
  GoRoute(
    path: Routes.home,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: Routes.login,
    builder: (context, state) => BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepo>()),
      child: LoginScreen(),
    ),
  ),
  GoRoute(
    path: Routes.signup,
    builder: (context, state) => BlocProvider(
      create: (context) => SignupCubit(getIt<SignupRepo>()),
      child: SignupScreen(),
    ),
  ),
]);
