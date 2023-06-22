import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  @override
  final String name;

  const CountryModel({required this.name}) : super(name: name);

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
