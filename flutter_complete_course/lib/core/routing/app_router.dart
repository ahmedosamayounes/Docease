import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/booking/logic/cubit/appointment_cubit.dart';
import '../../features/booking/ui/booking_screen.dart';
import '../../features/home/data/models/specialization_and_doctor_response_model.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/sign_up/logic/cubit/sign_up_cubit.dart';
import '../../features/sign_up/ui/sign_up_screen.dart';
import '../di/depnedency_injaction.dart';
import 'routes.dart';

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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())..getSpecializationsHome(),
            child: HomeScreen(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignupScreen(),
          ),
        );

      case Routes.bookingScreen:
        final doctor = settings.arguments as Doctors;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AppointmentCubit>(),
            child: BookingScreen(doctorModel: doctor),
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
