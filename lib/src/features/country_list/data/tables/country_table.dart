import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:hive/hive.dart';

part 'country_table.g.dart';

@HiveType(typeId: 0)
class CountryTable extends CountryEntity {
  @HiveField(0)
  final int? id;

  @override
  @HiveField(1)
  final String name;

  const CountryTable({this.id, required this.name}) : super(name: name);

  factory CountryTable.fromCountryEntity(CountryEntity countryEntity) {
    return CountryTable(
      name: countryEntity.name,
    );
  }
}
