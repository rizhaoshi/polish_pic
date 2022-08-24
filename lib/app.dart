import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polish_pic/routes/app_routes.dart';

Widget createApp() {
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.RED_ENVELOPE,
    getPages: AppPages.pages,
  );
}
