import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/entities/app_error.dart';
import '../../../../common/usecase/usecase.dart';
import '../repositories/country_repositories.dart';

class SaveCountry extends UseCase<void, CountryEntity> {
  final CountryRepository countryRepository;
  SaveCountry(this.countryRepository);

  @override
  Future<Either<AppError, void>> call(CountryEntity params) async {
    return await countryRepository.saveCountry(params);
  }
}
