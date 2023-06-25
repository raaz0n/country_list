# Country List App

A Flutter Country List app build with Bloc and [Rest Countries](https://restcountries.com/v2/all) api.

## Task:
Create a flutter application that fetches the list of countries (use open source api) and displays the list in a screen. Allow the user to rename one or two items from the list fetched from the api and store the changed names in the local database. On the other page, display the names stored in the local database. Also write unit and widget tests well.

Most preferred :-
1. State management : - BLOC
2. Project Architecture : - Clean Architecture

# How to Run
1. Clone the repo
   ```sh
   git clone https://github.com/rajan-poudel/country_list.git
   cd country_list
   ```
2. Install all the packages by typing
   ```sh
   flutter pub get
   ```
3. Run App
   ```sh
   flutter run
   ```
## Project Structure



```bash
.
├── main.dart
└── src
    ├── common
    │   ├── constants
    │   │   ├── logger.dart
    │   │   ├── route.dart
    │   │   ├── size_constant.dart
    │   │   └── string_constants.dart
    │   ├── core
    │   │   ├── api_client.dart
    │   │   ├── api_constant.dart
    │   │   └── common_observer.dart
    │   ├── entities
    │   │   ├── app_error.dart
    │   │   └── no_params.dart
    │   ├── screenUtils
    │   │   └── size_config.dart
    │   ├── themes
    │   │   └── theme_color.dart
    │   └── usecase
    │       └── usecase.dart
    ├── dependency_injection
    │   └── get_it.dart
    └── features
        └── country_list
            ├── data
            │   ├── data_sources
            │   │   ├── country_local_data_sources.dart
            │   │   └── country_remote_data_source.dart
            │   ├── models
            │   │   ├── country_model.dart
            │   │   └── country_model.g.dart
            │   ├── repositories
            │   │   └── country_repositories_impl.dart
            │   └── tables
            │       ├── country_table.dart
            │       └── country_table.g.dart
            ├── domain
            │   ├── entities
            │   │   └── country_entity.dart
            │   ├── repositories
            │   │   └── country_repositories.dart
            │   └── usecases
            │       ├── get_country.dart
            │       ├── get_local_countries.dart
            │       └── save_country.dart
            └── presentation
                ├── bloc
                │   ├── country_bloc
                │   │   ├── country_bloc_bloc.dart
                │   │   ├── country_bloc_event.dart
                │   │   └── country_bloc_state.dart
                │   └── save_country
                │       ├── save_country_bloc.dart
                │       ├── save_country_event.dart
                │       └── save_country_state.dart
                ├── pages
                │   ├── home_pages.dart
                │   └── save_country_screen.dart
                └── widgets
                    ├── alert_dialog_widget.dart
                    └── text_widget.dart
