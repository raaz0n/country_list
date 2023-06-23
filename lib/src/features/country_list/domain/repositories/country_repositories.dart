import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/entities/app_error.dart';

abstract class CountryRepository {
  Future<Either<AppError, List<CountryEntity>>> getCountry();
  Future<Either<AppError, void>> saveCountry(CountryEntity countryEntity);
  Future<Either<AppError, List<CountryEntity>>> getSaveCountries();
}
