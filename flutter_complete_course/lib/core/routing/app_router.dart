import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_course/core/di/depnedency_injaction.dart';
import 'package:flutter_complete_course/core/routing/routes.dart';
import 'package:flutter_complete_course/features/home/ui/home_screen.dart';
import 'package:flutter_complete_course/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_course/features/login/ui/login_screen.dart';
import 'package:flutter_complete_course/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter_complete_course/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_complete_course/features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());


      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignupScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
