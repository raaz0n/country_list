import 'package:country_list/src/features/country_list/data/data_sources/country_local_data_sources.dart';
import 'package:country_list/src/features/country_list/data/data_sources/country_remote_data_source.dart';
import 'package:country_list/src/features/country_list/data/repositories/country_repositories_impl.dart';
import 'package:country_list/src/features/country_list/domain/repositories/country_repositories.dart';
import 'package:country_list/src/features/country_list/domain/usecases/get_country.dart';
import 'package:country_list/src/features/country_list/domain/usecases/get_local_countries.dart';
import 'package:country_list/src/features/country_list/domain/usecases/save_country.dart';
import 'package:country_list/src/features/country_list/presentation/country_bloc/country_bloc_bloc.dart';
import 'package:country_list/src/features/country_list/presentation/save_country/save_country_bloc.dart';
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

  //save country bloc
  getItInstance.registerFactory(
    () => SaveCountryBloc(
      getItInstance(),
      getItInstance(),
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

  // local data source
  getItInstance.registerLazySingleton<CountryLocalDataSource>(
    () => CountryLocalDataSourceImpl(),
  );

  //usecase
  getItInstance.registerLazySingleton<GetCountry>(
    () => GetCountry(
      getItInstance(),
    ),
  );

  //hive database use case

  getItInstance.registerLazySingleton<SaveCountry>(
    () => SaveCountry(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetSaveCountries>(
    () => GetSaveCountries(
      getItInstance(),
    ),
  );

  //repository
  getItInstance.registerLazySingleton<CountryRepository>(
    () => CountryRepositoryImpl(
      getItInstance(),
      getItInstance(),
    ),
  );
}
