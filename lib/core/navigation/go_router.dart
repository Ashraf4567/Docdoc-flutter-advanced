import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/navigation/routes.dart';
import 'package:flutter_advanced/features/home/ui/cubit/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/ui/home_screen.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/presentation/login_screen.dart';
import 'package:flutter_advanced/features/onboarding/onboarding_screen.dart';
import 'package:flutter_advanced/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter_advanced/features/signup/ui/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter(
    String entryLocation
    ) => GoRouter(
  initialLocation: entryLocation,
  routes: [

  GoRoute(
    path: Routes.onboarding,
    builder: (context, state) => OnboardingScreen(),
  ),
  GoRoute(
    path: Routes.home,
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<HomeCubit>()..getHomeData(),
      child: HomeScreen(),
    ),
  ),
  GoRoute(
    path: Routes.login,
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: LoginScreen(),
    ),
  ),
  GoRoute(
    path: Routes.signup,
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: SignupScreen(),
    ),
  ),
]);
