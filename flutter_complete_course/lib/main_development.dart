import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_course/core/di/depnedency_injaction.dart';
import 'package:flutter_complete_course/core/routing/app_router.dart';
import 'package:flutter_complete_course/doc_ease_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.amber,
    statusBarColor: Colors.pink,
  ));
  runApp(DoceaseApp(appRouter: AppRouter(),));
}


