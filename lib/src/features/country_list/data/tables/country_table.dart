import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:hive/hive.dart';

part 'country_table.g.dart';

@HiveType(typeId: 0)
class CountryTable extends CountryEntity {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String name;

  const CountryTable({required this.id, required this.name})
      : super(name: name, id: id);

  factory CountryTable.fromCountryEntity(CountryEntity countryEntity) {
    return CountryTable(
      name: countryEntity.name,
      id: countryEntity.id,
    );
  }
}
