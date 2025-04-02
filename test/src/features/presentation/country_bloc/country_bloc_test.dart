import 'package:bloc_test/bloc_test.dart';
import 'package:country_list/src/common/entities/app_error.dart';
import 'package:country_list/src/common/entities/no_params.dart';
import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:country_list/src/features/country_list/domain/usecases/get_country.dart';
import 'package:country_list/src/features/country_list/presentation/bloc/country_bloc/country_bloc_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'country_bloc_test.mocks.dart';

@GenerateMocks([GetCountry])
void main() {
  late MockGetCountry mockGetCountry;
  late CountryBloc countryBloc;

  setUp(() {
    mockGetCountry = MockGetCountry();
    countryBloc = CountryBloc(getCountry: mockGetCountry);
  });

  tearDown(() {
    countryBloc.close();
  });

  final List<CountryEntity> tCountries = [
    CountryEntity(name: 'Country 1', id: '1'),
    CountryEntity(name: 'Country 2', id: '2'),
  ];

  group('CountryBloc Tests', () {
    test('Initial state should be CountryInitial', () {
      expect(countryBloc.state, CountryInitial());
    });

    blocTest<CountryBloc, CountryState>(
      'emits [CountryLoaded] when CountryLoadEvent is added and fetch is successful',
      build: () {
        when(mockGetCountry(NoParams())).thenAnswer((_) async => Right(tCountries));
        return countryBloc;
      },
      act: (bloc) => bloc.add(CountryLoadEvent()),
      expect: () => [CountryLoaded(countries: tCountries)],
    );

    blocTest<CountryBloc, CountryState>(
      'emits [CountryError] when CountryLoadEvent is added and fetch fails',
      build: () {
        when(mockGetCountry(NoParams())).thenAnswer((_) async => Left(AppError("Failed to fetch data")));
        return countryBloc;
      },
      act: (bloc) => bloc.add(CountryLoadEvent()),
      expect: () => [CountryError()],
    );
  });
}
