import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_sample_news_app_flutter/core/network/network_info.dart';

import 'network_info_test.mocks.dart';
//for deleting   dart run build_runner build --delete-conflicting-outputs
//if we run this command fake repository  will be generated  for NewsRepository
//flutter pub run build_runner build
//modified
@GenerateMocks([InternetConnectionChecker])
void main() {
 late NetworkInfoImpl networkInfo;
 late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should return false when there is no internet connection',
      () async {
        // arrange
        final tHasConnectionFuture = Future.value(false);

        when(mockInternetConnectionChecker.hasConnection)
            .thenAnswer((_) async => tHasConnectionFuture);
        // act
       final result =await networkInfo.isConnected;
     //   assert
        verify(mockInternetConnectionChecker.hasConnection);
        expect(result, false);
      },
    );
    test(
      'should return true when there is  an internet connection',
      () async {
        // arrange
        final tHasConnectionFuture = Future.value(true);

        when(mockInternetConnectionChecker.hasConnection)
            .thenAnswer((_) async => tHasConnectionFuture);
        // act
       final result =await networkInfo.isConnected;
     //   assert
        verify(mockInternetConnectionChecker.hasConnection);
        expect(result, true);
      },
    );
  });
}
