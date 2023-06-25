part of 'country_bloc_bloc.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

class CountryLoadEvent extends CountryEvent {
  // final List<CountryEntity> countries;
  // const CountryLoadEvent(this.countries);
  // @override
  // List<Object> get props => [countries];
}
