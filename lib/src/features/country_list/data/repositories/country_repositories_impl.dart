import 'package:country_list/src/features/country_list/data/data_sources/country_local_data_sources.dart';
import 'package:country_list/src/features/country_list/data/data_sources/country_remote_data_source.dart';
import 'package:country_list/src/features/country_list/data/models/country_model.dart';
import 'package:country_list/src/features/country_list/data/tables/country_table.dart';
import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:country_list/src/features/country_list/domain/repositories/country_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/entities/app_error.dart';

class CountryRepositoryImpl extends CountryRepository {
  final CountryRemoteDataSource remoteDataSource;
  final CountryLocalDataSource localDataSource;
  CountryRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<AppError, List<CountryModel>>> getCountry() async {
    try {
      final countries = await remoteDataSource.getCountry();
      return Right(countries);
    } on Exception {
      return const Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, void>> saveCountry(
      CountryEntity countryEntity) async {
    try {
      final response = await localDataSource
          .saveCountry(CountryTable.fromCountryEntity(countryEntity));
      return Right(response);
    } on Exception {
      return const Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, List<CountryEntity>>> getSaveCountries() async {
    try {
      final response = await localDataSource.getCountries();
      return Right(response);
    } on Exception {
      return const Left(AppError("something Want Wroung"));
    }
  }
}
