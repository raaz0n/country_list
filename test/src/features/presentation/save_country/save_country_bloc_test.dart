import 'package:bloc_test/bloc_test.dart';
import 'package:country_list/src/common/entities/app_error.dart';
import 'package:country_list/src/common/entities/no_params.dart';
import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:country_list/src/features/country_list/domain/usecases/get_local_countries.dart';
import 'package:country_list/src/features/country_list/domain/usecases/save_country.dart';
import 'package:country_list/src/features/country_list/presentation/bloc/save_country/save_country_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_country_bloc_test.mocks.dart';

@GenerateMocks([GetSaveCountries, SaveCountry])
void main() {
  late MockGetSaveCountries mockGetSaveCountries;
  late MockSaveCountry mockSaveCountry;
  late SaveCountryBloc saveCountryBloc;

  setUp(() {
    mockGetSaveCountries = MockGetSaveCountries();
    mockSaveCountry = MockSaveCountry();
    saveCountryBloc = SaveCountryBloc(mockGetSaveCountries, mockSaveCountry);
  });

  tearDown(() {
    saveCountryBloc.close();
  });
  final List<CountryEntity> tCountries = [
    CountryEntity(name: 'Country 1', id: '1'),
    CountryEntity(name: 'Country 2', id: '2'),
  ];

  group("SaveCountryBloc Test", () {
    test("Initial state should be SaveCountryInitial", () {
      expect(saveCountryBloc.state, SaveCountryInitial());
    });

    blocTest<SaveCountryBloc, SaveCountryState>(
      "emits [SaveCountryLoaded] when CountryFetchEvent is added and fetch is successful",
      build: () {
        when(mockGetSaveCountries(NoParams())).thenAnswer(
          (_) async => Right(tCountries),
        );
        return saveCountryBloc;
      },
      act: (bloc) => bloc.add(CountryFetchEvent()),
      expect: () => [SaveCountryLoaded(tCountries)],
    );

    blocTest<SaveCountryBloc, SaveCountryState>("calls saveCountry when CountrySaveEvent is added", build: () {
      when(mockSaveCountry(any)).thenAnswer((_) async => const Right(null));
      return saveCountryBloc;
    }, act: (bloc) {
      bloc.add(CountrySaveEvent(tCountries[0]));
    }, verify: (_) {
      verify(mockSaveCountry(tCountries[0]));
    });

    blocTest<SaveCountryBloc, SaveCountryState>(
      "emits [SaveCountryError] when CountryFetchEvent is added and fetch fails",
      build: () {
        when(mockGetSaveCountries(NoParams())).thenAnswer(
          (_) async => Left(AppError("Failed to fetch data")),
        );
        return saveCountryBloc;
      },
      act: (bloc) => bloc.add(CountryFetchEvent()),
      expect: () => [SaveCountryError()],
    );
  });
}
