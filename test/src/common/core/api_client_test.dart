import 'package:country_list/src/common/core/api_client.dart';
import 'package:country_list/src/common/core/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ApiClient apiClient;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiClient = ApiClient(mockClient);
  });

  group('ApiClient', () {
    test('should make a GET request with the provided path and headers',
        () async {
      // Arrange
      const path = '/all';
      const headers = {'Content-Type': 'application/json'};
      final expectedUri = Uri.parse('${ApiConstant.BASE_URL}$path');

      when(mockClient.get(expectedUri, headers: headers))
          .thenAnswer((_) async => http.Response('response body', 200));

      // Act
      await apiClient.get(path: path, headers: headers);

      // Assert
      verify(mockClient.get(expectedUri, headers: headers));
    });

    test('should return a response when the GET request is successful',
        () async {
      // Arrange
      const path = '/all';
      const headers = {'Content-Type': 'application/json'};
      final expectedUri = Uri.parse('${ApiConstant.BASE_URL}$path');
      const responseBody = 'response body';

      when(mockClient.get(expectedUri, headers: headers))
          .thenAnswer((_) async => http.Response(responseBody, 200));

      // Act
      final response = await apiClient.get(path: path, headers: headers);

      // Assert
      expect(response.statusCode, 200);
      expect(response.body, responseBody);
    });
  });
}
