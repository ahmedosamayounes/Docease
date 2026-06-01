import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/di/depnedency_injaction.dart';
import 'core/routing/app_router.dart';
import 'doc_ease_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  setupGetIt();
   // to fix texts being font bug in flutter ScreenUtil in release mode
    await ScreenUtil.ensureScreenSize();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.amber,
    statusBarColor: Colors.amber,
  ));
  runApp(DoceaseApp(appRouter: AppRouter(),));
}

