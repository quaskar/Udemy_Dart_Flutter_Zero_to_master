import 'package:adviser/infrastructure/datasources/advicer_remote_datasource.dart';
import 'package:adviser/infrastructure/exceptions/exceptions.dart';
import 'package:adviser/infrastructure/models/advice_model.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../fixtures/fixture_reader.dart';

import 'advice_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late AdvicerRemoteDatasource advicerRemoteDatasource;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    advicerRemoteDatasource = AdvicerRemoteDatasourceImpl(client: mockClient);
  });

  void setUpMockClientSuccess200() {
    when(mockClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(fixture("advice_http_respond.json"), 200));
  }

  void setUpMockClientFailure404() {
    when(mockClient.get(any, headers: anyNamed("headers")))
        .thenAnswer((_) async => http.Response("something went wrong", 404));
  }

  group("getRandomAdviceFromApi", () {
    final t_adviceModel = AdviceModel(advice: "test", id: 1);

    test(
        "should perform a get request on a URAL with advice being the end point and header application/json",
        () {
      // arrange
      setUpMockClientSuccess200();

      // act
      advicerRemoteDatasource.getRandomAdviceFromApi();

      // assert
      verify(mockClient.get(
        Uri.parse("https://api.adviceslip.com/advice"),
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test("should return a valid advice when response is success 200", () async {
      // arrange
      setUpMockClientSuccess200();

      // act
      final result = await advicerRemoteDatasource.getRandomAdviceFromApi();

      // assert
      expect(result, t_adviceModel);
    });

    test("should throw server exception is server response is not 200", () {
      // arrange
      setUpMockClientFailure404();

      // act
      final call = advicerRemoteDatasource.getRandomAdviceFromApi;

      // assert
      expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
