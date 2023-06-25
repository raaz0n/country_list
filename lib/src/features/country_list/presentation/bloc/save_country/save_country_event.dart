part of 'save_country_bloc.dart';

abstract class SaveCountryEvent extends Equatable {
  const SaveCountryEvent();

  @override
  List<Object> get props => [];
}

class CountryFetchEvent extends SaveCountryEvent {}

class CountrySaveEvent extends SaveCountryEvent {
  final CountryEntity countryEntity;
  const CountrySaveEvent(this.countryEntity);
  @override
  List<Object> get props => [countryEntity];
}
