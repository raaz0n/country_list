import 'package:country_list/src/common/constants/string_constants.dart';
import 'package:country_list/src/features/country_list/presentation/pages/home_pages.dart';
import 'package:country_list/src/features/country_list/presentation/pages/save_country_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeRoute = "/";
  static const String saveCountryRoute = "/saveCountry";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    // final arg = routeSettings.arguments;

    final routes = switch (routeSettings.name) {
      Routes.homeRoute => MaterialPageRoute(
          builder: (_) => const HomePageScreen(),
        ),
      Routes.saveCountryRoute => MaterialPageRoute(
          builder: (_) => const SaveCountryScreen(),
        ),
      _ => unDefinedRoute(),
    };
    return routes;
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(StringConstants.noRouteFound),
        ),
        body: const Center(child: Text("No Route Found")),
      ),
    );
  }
}
