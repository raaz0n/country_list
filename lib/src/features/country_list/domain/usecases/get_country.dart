import 'package:country_list/src/features/country_list/domain/entities/country_entity.dart';
import 'package:country_list/src/features/country_list/domain/repositories/country_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/entities/app_error.dart';
import '../../../../common/entities/no_params.dart';
import '../../../../common/usecase/usecase.dart';

class GetCountry extends UseCase<List<CountryEntity>, NoParams> {
  final CountryRepository countryRepository;
  GetCountry(this.countryRepository);

  @override
  Future<Either<AppError, List<CountryEntity>>> call(NoParams noParams) async {
    return await countryRepository.getCountry();
  }
}
