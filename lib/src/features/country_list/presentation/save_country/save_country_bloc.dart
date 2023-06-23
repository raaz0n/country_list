import 'package:country_list/src/common/entities/no_params.dart';
import 'package:country_list/src/features/country_list/domain/usecases/get_local_countries.dart';
import 'package:country_list/src/features/country_list/domain/usecases/save_country.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/entities/app_error.dart';
import '../../domain/entities/country_entity.dart';

part 'save_country_event.dart';
part 'save_country_state.dart';

class SaveCountryBloc extends Bloc<SaveCountryEvent, SaveCountryState> {
  GetSaveCountries getSaveCountries;
  SaveCountry saveCountry;
  SaveCountryBloc(this.getSaveCountries, this.saveCountry)
      : super(SaveCountryInitial()) {
    on<SaveCountryEvent>((event, emit) async {
      if (event is CountryFetchEvent) {
        Either<AppError, List<CountryEntity>>? countryEither;
        countryEither = await getSaveCountries(NoParams());
        emit(
          countryEither.fold(
            (l) => SaveCountryError(),
            (countries) => SaveCountryLoaded(
              countries,
            ),
          ),
        );
      } else if (event is CountrySaveEvent) {
        await saveCountry(event.countryEntity);
      }
    });
  }
}
