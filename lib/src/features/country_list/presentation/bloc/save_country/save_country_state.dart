part of 'save_country_bloc.dart';

abstract class SaveCountryState extends Equatable {
  const SaveCountryState();

  @override
  List<Object> get props => [];
}

class SaveCountryInitial extends SaveCountryState {}

class SaveCountryLoaded extends SaveCountryState {
  final List<CountryEntity> countries;
  const SaveCountryLoaded(this.countries);
}

class SaveCountryError extends SaveCountryState {}
