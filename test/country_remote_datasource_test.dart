// import 'package:country_list/src/common/core/api_client.dart';
// import 'package:country_list/src/common/core/api_constant.dart';
// import 'package:country_list/src/features/country_list/data/data_sources/country_remote_data_source.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:country_list/src/features/country_list/data/models/country_model.dart';
// import 'package:http/http.dart' as http;

// class MockHttpClient extends Mock implements http.Client {}

// void main() {
//   late CountryRemoteDataSourceImpl dataSource;
//   late MockHttpClient mockHttpClient;

//   setUp(() {
//     mockHttpClient = MockHttpClient();
//     dataSource = CountryRemoteDataSourceImpl(ApiClient(mockHttpClient));
//   });

//   group('getCountry', () {
//     const mockResponse = '''
//       [
//         {"name": "Country 1", "numericCode": "1"},
//         {"name": "Country 2", "numericCode": "2"}
//       ]
//     ''';

//     test('should return a list of CountryModel when the API call is successful',
//         () async {
//       // Arrange
//       when(mockHttpClient.get(
//         Uri.parse('${ApiConstant.BASE_URL}all'),
//         headers: anyNamed('headers'),
//       )).thenAnswer((_) async => http.Response(mockResponse, 200));

//       // Act
//       final result = await dataSource.getCountry();

//       // Assert
//       expect(result, isA<List<CountryModel>>());
//       expect(result.length, 2);
//       expect(result[0].name, 'Country 1');
//       expect(result[0].id, '1');
//       expect(result[1].name, 'Country 2');
//       expect(result[1].id, '2');

//       // Verify the API call
//       verify(mockHttpClient.get(
//         Uri.parse('${ApiConstant.BASE_URL}all'),
//         headers: anyNamed('headers'),
//       )).called(1);
//     });
//   });
// }
