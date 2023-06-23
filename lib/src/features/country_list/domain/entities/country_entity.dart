import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String name;
  final String id;

  const CountryEntity({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [name, id];

  @override
  bool? get stringify => true;
}
