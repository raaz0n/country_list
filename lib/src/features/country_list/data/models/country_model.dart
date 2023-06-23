import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel extends CountryEntity {
  @override
  @JsonKey(name: 'numericCode')
  final String id;

  @override
  @JsonKey(name: 'name')
  final String name;

  const CountryModel({required this.name, required this.id})
      : super(name: name, id: id);

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
