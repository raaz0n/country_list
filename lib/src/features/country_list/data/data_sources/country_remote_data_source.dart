import 'dart:convert';

import 'package:country_list/src/features/country_list/data/models/country_model.dart';

import '../../../../common/core/api_client.dart';

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> GetCountry();
}

class CountryRemoteDataSourceImpl extends CountryRemoteDataSource {
  final ApiClient _client;
  CountryRemoteDataSourceImpl(this._client);

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  @override
  Future<List<CountryModel>> GetCountry() async {
    List<CountryModel> list = [];
    final response = await _client.get(
      path: "/all",
      headers: headers,
    );
    final List<dynamic> object = json.decode(response.body);
    list = object.map((json) => CountryModel.fromJson(json)).toList();

    return list;
  }
}
