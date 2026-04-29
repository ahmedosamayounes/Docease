import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/helpers/constants.dart';
import 'package:flutter_complete_course/core/routing/app_router.dart';
import 'package:flutter_complete_course/core/routing/routes.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoceaseApp extends StatelessWidget {
  final AppRouter appRouter;
  const DoceaseApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DoceaseApp',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.onboardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
