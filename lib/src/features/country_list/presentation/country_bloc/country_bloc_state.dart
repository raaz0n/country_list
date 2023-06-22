part of 'country_bloc_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<CountryEntity> countries;
  const CountryLoaded({required this.countries});

  @override
  List<Object> get props => [countries];
}

class CountryError extends CountryState {}
