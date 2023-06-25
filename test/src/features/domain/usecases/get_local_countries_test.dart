import 'package:country_list/src/common/entities/no_params.dart';
import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:country_list/src/features/country_list/domain/repositories/country_repositories.dart';
import 'package:country_list/src/features/country_list/domain/usecases/get_local_countries.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_local_countries_test.mocks.dart';

@GenerateMocks([CountryRepository])
void main() {
  late GetSaveCountries getSaveCountries;
  late MockCountryRepository mockCountryRepository;

  setUp(() {
    mockCountryRepository = MockCountryRepository();
    getSaveCountries = GetSaveCountries(mockCountryRepository);
  });

  test('should return a list of countries from the box', () async {
    final countries = [
      const CountryEntity(name: 'Country 1', id: '1'),
      const CountryEntity(name: 'Country 2', id: '2'),
    ];

    when(mockCountryRepository.getSaveCountries())
        .thenAnswer((_) async => Right(countries));

    final result = await getSaveCountries(NoParams());

    expect(result.getOrElse(() => []), equals(countries));
    verify(mockCountryRepository.getSaveCountries());
  });
}
