import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:country_list/src/features/country_list/domain/repositories/country_repositories.dart';
import 'package:country_list/src/features/country_list/domain/usecases/save_country.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_country_test.mocks.dart';

@GenerateMocks([CountryRepository])
void main() {
  late SaveCountry saveCountry;
  late MockCountryRepository mockCountryRepository;
  setUp(() {
    mockCountryRepository = MockCountryRepository();
    saveCountry = SaveCountry(mockCountryRepository);
  });

  test("should save the country when called with valid parameters", () async {
    //Arrange
    const countryEntity = CountryEntity(id: '1', name: 'Country 1');
    when(mockCountryRepository.saveCountry(countryEntity))
        .thenAnswer((_) async => const Right(null));

    //Act
    final result = await saveCountry(countryEntity);

    //Assert
    expect(result, const Right(null));
    verify(mockCountryRepository.saveCountry(countryEntity));
  });
}
