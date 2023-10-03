import 'package:get/get.dart';
import 'package:my_sample_news_app_flutter/utils/constant.dart';

class ApiDataSource extends GetConnect {
  Future<Response> getNewsRes() async {
    return await get(
        '${Constant.BASE_URL}/v2/top-headlines?country=us&apiKey=${Constant.KEY}');
  }
}
