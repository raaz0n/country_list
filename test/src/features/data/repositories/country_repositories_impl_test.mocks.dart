// Mocks generated by Mockito 5.4.2 from annotations
// in country_list/test/src/features/data/repositories/country_repositories_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:country_list/src/features/country_list/data/data_sources/country_local_data_sources.dart'
    as _i5;
import 'package:country_list/src/features/country_list/data/data_sources/country_remote_data_source.dart'
    as _i2;
import 'package:country_list/src/features/country_list/data/models/country_model.dart'
    as _i4;
import 'package:country_list/src/features/country_list/data/tables/country_table.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [CountryRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCountryRemoteDataSource extends _i1.Mock
    implements _i2.CountryRemoteDataSource {
  MockCountryRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.CountryModel>> getCountry() => (super.noSuchMethod(
        Invocation.method(
          #getCountry,
          [],
        ),
        returnValue:
            _i3.Future<List<_i4.CountryModel>>.value(<_i4.CountryModel>[]),
      ) as _i3.Future<List<_i4.CountryModel>>);
}

/// A class which mocks [CountryLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCountryLocalDataSource extends _i1.Mock
    implements _i5.CountryLocalDataSource {
  MockCountryLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> saveCountry(_i6.CountryTable? countryTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveCountry,
          [countryTable],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<List<_i6.CountryTable>> getCountries() => (super.noSuchMethod(
        Invocation.method(
          #getCountries,
          [],
        ),
        returnValue:
            _i3.Future<List<_i6.CountryTable>>.value(<_i6.CountryTable>[]),
      ) as _i3.Future<List<_i6.CountryTable>>);
}
