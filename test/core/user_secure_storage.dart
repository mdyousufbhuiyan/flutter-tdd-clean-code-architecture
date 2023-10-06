import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_sample_news_app_flutter/core/user_secure_storage.dart';
import 'user_secure_storage.mocks.dart';

//for deleting   dart run build_runner build --delete-conflicting-outputs
//if we run this command fake repository  will be generated  for NewsRepository
//flutter pub run build_runner build
@GenerateMocks([FlutterSecureStorage])
void main() {
  late MockFlutterSecureStorage _storage;
  late UserSecureStorageImpl userSecureStorageImpl;

  setUp(() {
    _storage = MockFlutterSecureStorage();
    userSecureStorageImpl = UserSecureStorageImpl(_storage);
  });

  group('secureData', () {
    test(
      'should read data from storage',
      () async {
        // arrange
        final key = "test";
        final testData = "my data";

        when(_storage.read(key: key)).thenAnswer((_) async => testData);
        // act
        final result = await userSecureStorageImpl.getSecureData(key);
        //   assert
        // verify(mockInternetConnectionChecker.hasConnection);
        expect(result, testData);
      },
    );
    test(
      'should write data to storage',
          () async {
        // arrange
        const key = "test";
        const testData = "my data";

        when(_storage.write(key: key,value: testData)).thenAnswer((_) async => "success");
        // act
        final result = await userSecureStorageImpl.setSecureData(key,testData);
        //   assert
        // verify(mockInternetConnectionChecker.hasConnection);
        expect(result, "success");
      },
    );
    test(
      'should delete secure data from storage',
          () async {
        // arrange
        const key = "test";

        when(_storage.delete(key: key,)).thenAnswer((_) async => "deleted");
        // act
        final result = await userSecureStorageImpl.deleteSecureData(key);
        //   assert
        // verify(mockInternetConnectionChecker.hasConnection);
        expect(result, "deleted");
      },
    );
    test(
      'should delete all secure data from storage',
          () async {
        // arrange
        when(_storage.deleteAll()).thenAnswer((_) async => "deleted");
        // act
        final result = await userSecureStorageImpl.deleteAll();
        //   assert
        // verify(mockInternetConnectionChecker.hasConnection);
        expect(result, "deleted");
      },
    );
  });
}
