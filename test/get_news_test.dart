import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:my_sample_news_app_flutter/domain/entities/news_respone.dart';
import 'package:my_sample_news_app_flutter/domain/repository/news_repository.dart';
import 'package:my_sample_news_app_flutter/domain/usecase/get_news_usecase.dart';

import 'get_news_test.mocks.dart';

//if we run this command fake repository  will be generated  for NewsRepository
//flutter pub run build_runner build
@GenerateMocks([NewsRepository])
void main() {
  late NewsRepository _repository;
  late GetNewsUseCase _useCase;

  setUp(() {
    _repository = MockNewsRepository();
    _useCase = GetNewsUseCaseImpl(newsRepository: _repository);
  });

  test(
    "Should return news",
    () async {
      final news = NewsRespone.empty();

      when(_repository.getNews()).thenAnswer((realInvocation) async => news);
     // when(_repository.getNews()).thenAnswer((realInvocation) async =>  NewsRespone(status: "surress",totalResults: 1,articles: []));

      final result = await _useCase.call(null);

      expect(result.news, NewsRespone.empty());
   //   expect(result.news, NewsRespone(status: "surress",totalResults: 1,articles: []));
      expect(result.isSuccess, true);
    },
  );
  test(
    "Should faild return empty news response",
    () async {
      when(_repository.getNews()).thenThrow(Exception());

      final result = await _useCase.call(null);

      expect(result.news, NewsRespone.empty());
      expect(result.isSuccess, false);
    },
  );
}
