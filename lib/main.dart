import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_sample_news_app_flutter/routes.dart';
import 'main_binding.dart';
import 'presentation/feature/home/binding/home_binding.dart';
import 'presentation/feature/home/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Breaking News ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: MainBinding(),
      getPages: appPages,
      initialRoute: HomePage.routeName,
    );
  }
}
