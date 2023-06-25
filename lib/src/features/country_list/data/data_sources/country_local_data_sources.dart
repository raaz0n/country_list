import 'package:country_list/src/common/constants/string_constants.dart';
import 'package:country_list/src/features/country_list/data/tables/country_table.dart';
import 'package:hive/hive.dart';

abstract class CountryLocalDataSource {
  Future<void> saveCountry(CountryTable countryTable);
  Future<List<CountryTable>> getCountries();
}

class CountryLocalDataSourceImpl extends CountryLocalDataSource {
  // final HiveInterface hive;
  // CountryLocalDataSourceImpl(this.hive);
  @override
  Future<List<CountryTable>> getCountries() async {
    final countryBox = await Hive.openBox(StringConstants.COUNTRYBOX);
    final List<CountryTable> countries = [];
    for (var element in countryBox.values) {
      countries.add(element);
    }
    return countries;
  }

  @override
  Future<void> saveCountry(CountryTable countryTable) async {
    final countryBox = await Hive.openBox(StringConstants.COUNTRYBOX);
    await countryBox.put(countryTable.id, countryTable);
  }
}
