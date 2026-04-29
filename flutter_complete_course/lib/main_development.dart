import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/di/depnedency_injaction.dart';
import 'package:flutter_complete_course/core/helpers/constants.dart';
import 'package:flutter_complete_course/core/helpers/extensions.dart';
import 'package:flutter_complete_course/core/helpers/shared_pref_helper.dart';
import 'package:flutter_complete_course/core/routing/app_router.dart';
import 'package:flutter_complete_course/doc_ease_app.dart';
import 'package:flutter_complete_course/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DoceaseApp(appRouter: AppRouter()));
}

  checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );

  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
