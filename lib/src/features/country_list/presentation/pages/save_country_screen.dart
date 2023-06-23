import 'package:country_list/src/common/constants/size_constant.dart';
import 'package:country_list/src/common/constants/string_constants.dart';
import 'package:country_list/src/common/themes/theme_color.dart';
import 'package:country_list/src/dependency_injection/get_it.dart';
import 'package:country_list/src/features/country_list/presentation/save_country/save_country_bloc.dart';
import 'package:country_list/src/features/country_list/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveCountryScreen extends StatefulWidget {
  const SaveCountryScreen({super.key});

  @override
  State<SaveCountryScreen> createState() => _SaveCountryScreenState();
}

class _SaveCountryScreenState extends State<SaveCountryScreen> {
  late SaveCountryBloc saveCountryBloc;

  @override
  void initState() {
    saveCountryBloc = getItInstance<SaveCountryBloc>();
    saveCountryBloc.add(CountryFetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    saveCountryBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColor.white,
        ),
        centerTitle: false,
        title: const BuildText(
          text: StringConstants.saveData,
          fontSize: Sizes.dimen_20,
          color: AppColor.white,
        ),
      ),
      body: BlocProvider<SaveCountryBloc>.value(
        value: saveCountryBloc,
        child: BlocBuilder<SaveCountryBloc, SaveCountryState>(
            builder: (context, state) {
          if (state is SaveCountryLoaded) {
            if (state.countries.isEmpty) {
              return const Center(
                child: BuildText(
                  text: "There is No Save Data",
                  color: AppColor.white,
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.countries.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColor.royalBlue.withOpacity(0.1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Sizes.dimen_8)),
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.dimen_10),
                      child: BuildText(
                        text: state.countries[index].name,
                        color: AppColor.white,
                        fontSize: 20,
                        overFlow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
