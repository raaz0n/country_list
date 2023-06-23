import 'package:country_list/src/features/country_list/data/tables/country_table.dart';
import 'package:hive/hive.dart';

abstract class CountryLocalDataSource {
  Future<void> saveCountry(CountryTable countryTable);
  Future<List<CountryTable>> getCountries();
}

class CountryLocalDataSourceImpl extends CountryLocalDataSource {
  @override
  Future<List<CountryTable>> getCountries() async {
    final countryBox = await Hive.openBox("countryBox");
    final List<CountryTable> countries = [];
    for (var element in countryBox.values) {
      countries.add(element);
    }
    return countries;
  }

  @override
  Future<void> saveCountry(CountryTable countryTable) async {
    final countryBox = await Hive.openBox("countryBox");
    await countryBox.put(countryTable.id, countryTable);
  }
}
