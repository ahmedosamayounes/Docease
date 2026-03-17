import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/di/depnedency_injaction.dart';
import 'package:flutter_complete_course/core/routing/app_router.dart';
import 'package:flutter_complete_course/doc_ease_app.dart';

void main() {
  setupGetIt();
  runApp(DoceaseApp(appRouter: AppRouter(),));
}


