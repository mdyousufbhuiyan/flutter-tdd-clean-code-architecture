import 'package:get/get.dart';
import '../../../../domain/entities/article.dart';
import '../../../../domain/entities/news_respone.dart';

import '../../../../domain/usecase/get_news_usecase.dart';
import '../../../../core/network/network_info.dart';

class HomeController extends GetxController with StateMixin<List<Article>> {
  final GetNewsUseCase _getNewsUseCase;
  NetworkInfoImpl networkInfo = Get.find();

  HomeController({
    required GetNewsUseCase getNewsUseCase,
  }) : _getNewsUseCase = getNewsUseCase;

  List<Article> articles = [];
  NewsRespone newsRespone = NewsRespone.empty();

  @override
  void onReady() {
    getNews();
    super.onReady();
  }

  Future<void> getNews() async {
    change(articles, status: RxStatus.loading());
    var isConnected = await networkInfo.isConnected;
    print(
        "isConnected........................isConnected......${isConnected}");
    if (isConnected) {
      final result = await _getNewsUseCase.call(null);
      if (result.isSuccess) {
        articles = result.news.articles;
        if (result.news.articles.isEmpty) {
          change(articles, status: RxStatus.empty());
        } else {
          change(articles, status: RxStatus.success());
        }
      } else {
        articles = result.news.articles;
        change(articles, status: RxStatus.error());
      }
    } else {
      //articles = result.news.articles;
      change(articles, status: RxStatus.error());
    }
  }
}
