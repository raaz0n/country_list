import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String name;

  const CountryEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [name];

  @override
  bool? get stringify => true;
}
