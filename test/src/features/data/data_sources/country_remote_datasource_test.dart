import 'package:country_list/src/common/core/api_client.dart';
import 'package:country_list/src/features/country_list/data/data_sources/country_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:country_list/src/features/country_list/data/models/country_model.dart';
import 'package:http/http.dart' as http;

import 'country_remote_datasource_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late CountryRemoteDataSourceImpl dataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = CountryRemoteDataSourceImpl(mockApiClient);
  });

  group('getCountry', () {
    const mockResponse = '''
      [
        {"name": "Country 1", "numericCode": "1"},
        {"name": "Country 2", "numericCode": "2"}
      ]
    ''';

    test('should return a list of CountryModel when the API call is successful',
        () async {
      // Arrange
      when(mockApiClient.get(
        path: "all",
        headers: {
          "Content-Type": "application/json",
        },
      )).thenAnswer((_) async => http.Response(mockResponse, 200));

      // Act
      final result = await dataSource.getCountry();

      // Assert
      expect(result, isA<List<CountryModel>>());
      expect(result.length, 2);
      expect(result[0].name, 'Country 1');
      expect(result[0].id, '1');
      expect(result[1].name, 'Country 2');
      expect(result[1].id, '2');

      // Verify the API call
      verify(mockApiClient.get(
        path: "all",
        headers: {
          "Content-Type": "application/json",
        },
      )).called(1);
    });
  });
}
