import 'package:get/get.dart';
import 'package:my_sample_news_app_flutter/presentation/feature/home/binding/home_binding.dart';
import 'package:my_sample_news_app_flutter/presentation/feature/home/view/home_page.dart';

final List<GetPage> appPages = [
  GetPage(
      name:  HomePage.routeName,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.upToDown)
];
