import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_sample_news_app_flutter/core/network/network_info.dart';
import 'package:my_sample_news_app_flutter/core/user_secure_storage.dart';
import 'data/datasource/api_datasource.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InternetConnectionChecker());
    Get.lazyPut(() => NetworkInfoImpl(Get.find()));
    Get.lazyPut(() => FlutterSecureStorage(aOptions: getAndroidOptions()));
    Get.lazyPut(() => UserSecureStorageImpl(Get.find()));
    Get.lazyPut(() => ApiDataSource());
  }
}
