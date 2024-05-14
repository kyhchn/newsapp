import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newsapp/app/core/theme/theme.dart';
import 'package:newsapp/app/core/utils/injection.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injection();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: getTheme(),
    ),
  );
}
