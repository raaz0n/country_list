import 'package:country_list/src/common/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'country_local_data_sources_test.mocks.dart';

import 'package:country_list/src/features/country_list/data/data_sources/country_local_data_sources.dart';
import 'package:country_list/src/features/country_list/data/tables/country_table.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  late CountryLocalDataSourceImpl dataSource;
  late MockHiveInterface mockHive;
  late MockBox mockBox;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // final appDocumentDir = await path.getApplicationDocumentsDirectory();
    Hive.init(" /data/user/0/com.example.country_list/app_flutter");
    Hive.registerAdapter(CountryTableAdapter());

    mockHive = MockHiveInterface();
    mockBox = MockBox();
    dataSource = CountryLocalDataSourceImpl();
  });

  group('CountryLocalDataSourceImpl', () {
    test('should save a country to the box', () async {
      // Arrange
      const countryTable = CountryTable(id: '1', name: 'Country 1');

      when(mockHive.openBox(StringConstants.COUNTRYBOX))
          .thenAnswer((_) async => mockBox);

      // Act
      await dataSource.saveCountry(countryTable);

      // Assert
      verifyNever(mockHive.openBox(StringConstants.COUNTRYBOX));
      verifyNever(mockBox.put(countryTable.id, countryTable));
    });

    test('should retrieve a list of countries from the box', () async {
      // Arrange
      const countryTable1 = CountryTable(id: '1', name: 'Country 1');
      final countryBoxValues = [countryTable1];

      when(mockHive.openBox(StringConstants.COUNTRYBOX))
          .thenAnswer((_) async => mockBox);
      when(mockBox.values).thenReturn(countryBoxValues);

      // Act
      final countries = await dataSource.getCountries();

      // Assert
      verifyNever(mockHive.openBox(StringConstants.COUNTRYBOX));
      verifyNever(mockBox.values);
      expect(countries, countryBoxValues);
    });
  });
}
