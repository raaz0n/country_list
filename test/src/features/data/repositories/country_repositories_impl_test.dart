import 'package:country_list/src/common/entities/app_error.dart';
import 'package:country_list/src/features/country_list/data/data_sources/country_local_data_sources.dart';
import 'package:country_list/src/features/country_list/data/data_sources/country_remote_data_source.dart';
import 'package:country_list/src/features/country_list/data/models/country_model.dart';
import 'package:country_list/src/features/country_list/data/repositories/country_repositories_impl.dart';
import 'package:country_list/src/features/country_list/data/tables/country_table.dart';
import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'country_repositories_impl_test.mocks.dart';

@GenerateMocks([CountryRemoteDataSource, CountryLocalDataSource])
void main() {
  late CountryRepositoryImpl repository;
  late MockCountryRemoteDataSource mockRemoteDataSource;
  late MockCountryLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockCountryRemoteDataSource();
    mockLocalDataSource = MockCountryLocalDataSource();
    repository =
        CountryRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
  });

  group('getCountry', () {
    const mockCountryModels = [
      CountryModel(name: 'Country 1', id: '1'),
      CountryModel(name: 'Country 2', id: '2'),
    ];

    test(
        'should return a list of CountryModels when the remote data source call is successful',
        () async {
      // Arrange
      when(mockRemoteDataSource.getCountry())
          .thenAnswer((_) async => mockCountryModels);

      // Act
      final result = await repository.getCountry();

      // Assert
      expect(result, const Right(mockCountryModels));
      verify(mockRemoteDataSource.getCountry());
      verifyNoMoreInteractions(mockRemoteDataSource);
      verifyZeroInteractions(mockLocalDataSource);
    });

    test(
        'should return an AppError when an exception is thrown by the remote data source',
        () async {
      // Arrange
      when(mockRemoteDataSource.getCountry())
          .thenThrow(Exception('something Want Wroung'));

      // Act
      final result = await repository.getCountry();

      // Assert
      expect(result, const Left(AppError('something Want Wroung')));
      verify(mockRemoteDataSource.getCountry());
      verifyNoMoreInteractions(mockRemoteDataSource);
      verifyZeroInteractions(mockLocalDataSource);
    });
  });

  group('saveCountry', () {
    const mockCountryEntity = CountryEntity(name: 'Country 1', id: '1');

    test('should return void when the local data source call is successful',
        () async {
      // Arrange
      when(mockLocalDataSource.saveCountry(any)).thenAnswer((_) async {});

      // Act
      final result = await repository.saveCountry(mockCountryEntity);

      // Assert
      expect(result, const Right(null));
      verify(mockLocalDataSource
          .saveCountry(CountryTable.fromCountryEntity(mockCountryEntity)));
      verifyNoMoreInteractions(mockLocalDataSource);
      verifyZeroInteractions(mockRemoteDataSource);
    });

    test(
        'should return an AppError when an exception is thrown by the local data source',
        () async {
      // Arrange
      when(mockLocalDataSource.saveCountry(any))
          .thenThrow(Exception('something Want Wroung'));

      // Act
      final result = await repository.saveCountry(mockCountryEntity);

      // Assert
      expect(result, const Left(AppError('something Want Wroung')));
      verify(mockLocalDataSource
          .saveCountry(CountryTable.fromCountryEntity(mockCountryEntity)));
      verifyNoMoreInteractions(mockLocalDataSource);
      verifyZeroInteractions(mockRemoteDataSource);
    });
  });

  group('getSaveCountries', () {
    const mockCountryEntities = [
      CountryTable(name: 'Country 1', id: '1'),
      CountryTable(name: 'Country 2', id: '2'),
    ];

    test(
        'should return a list of CountryEntities when the local data source call is successful',
        () async {
      // Arrange
      when(mockLocalDataSource.getCountries())
          .thenAnswer((_) async => mockCountryEntities);

      // Act
      final result = await repository.getSaveCountries();

      // Assert
      expect(result, const Right(mockCountryEntities));
      verify(mockLocalDataSource.getCountries());
    });

    test(
        'should return an AppError when an exception is thrown by the local data source',
        () async {
      // Arrange
      when(mockLocalDataSource.getCountries())
          .thenThrow(Exception('something Want Wroung'));

      // Act
      final result = await repository.getSaveCountries();

      // Assert
      expect(result, const Left(AppError('something Want Wroung')));
      verify(mockLocalDataSource.getCountries());
    });
  });
}
