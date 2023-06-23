import 'package:country_list/src/features/country_list/domain/usecases/get_country.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/entities/app_error.dart';
import '../../../../common/entities/no_params.dart';
import '../../domain/entities/country_entity.dart';

part 'country_bloc_event.dart';
part 'country_bloc_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  GetCountry getCountry;
  CountryBloc({required this.getCountry}) : super(CountryInitial()) {
    on<CountryEvent>((event, emit) async {
      if (event is CountryLoadEvent) {
        Either<AppError, List<CountryEntity>>? countryEither;
        countryEither = await getCountry(NoParams());
        emit(
          countryEither.fold(
            (l) => CountryError(),
            (countries) => CountryLoaded(
              countries: countries,
            ),
          ),
        );
      }
    });
  }
}
