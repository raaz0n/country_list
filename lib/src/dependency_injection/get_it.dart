import 'package:country_list/src/features/country_list/data/data_sources/country_remote_data_source.dart';
import 'package:country_list/src/features/country_list/data/repositories/country_repositories_impl.dart';
import 'package:country_list/src/features/country_list/domain/repositories/country_repositories.dart';
import 'package:country_list/src/features/country_list/domain/usecases/get_country.dart';
import 'package:country_list/src/features/country_list/presentation/country_bloc/country_bloc_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../common/core/api_client.dart';

final getItInstance = GetIt.I;

Future init() async {
  //! Bloc

  //country  bloc
  getItInstance.registerFactory(
    () => CountryBloc(
      getCountry: getItInstance(),
    ),
  );

  //! core
  getItInstance.registerLazySingleton<Client>(
    () => Client(),
  );

  getItInstance.registerLazySingleton<ApiClient>(
    () => ApiClient(
      getItInstance(),
    ),
  );

  //! feature
  //remote data source
  getItInstance.registerLazySingleton<CountryRemoteDataSource>(
    () => CountryRemoteDataSourceImpl(
      getItInstance(),
    ),
  );

  //usecase
  getItInstance.registerLazySingleton<GetCountry>(
    () => GetCountry(
      getItInstance(),
    ),
  );

  //repository
  getItInstance.registerLazySingleton<CountryRepository>(
    () => CountryRepositoryImpl(
      getItInstance(),
    ),
  );
}
