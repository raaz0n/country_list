import 'package:country_list/src/features/country_list/data/data_sources/country_remote_data_source.dart';
import 'package:country_list/src/features/country_list/data/models/country_model.dart';
import 'package:country_list/src/features/country_list/domain/repositories/country_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/entities/app_error.dart';

class CountryRepositoryImpl extends CountryRepository {
  final CountryRemoteDataSource remoteDataSource;
  CountryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<CountryModel>>> getCountry() async {
    try {
      final countries = await remoteDataSource.GetCountry();
      return Right(countries);
    } on Exception {
      return const Left(AppError("something Want Wroung"));
    }
  }
}
