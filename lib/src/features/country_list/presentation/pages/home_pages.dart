import 'package:country_list/src/common/constants/size_constant.dart';
import 'package:country_list/src/common/constants/string_constants.dart';
import 'package:country_list/src/common/screenUtils/size_config.dart';
import 'package:country_list/src/common/themes/theme_color.dart';
import 'package:country_list/src/dependency_injection/get_it.dart';
import 'package:country_list/src/features/country_list/presentation/country_bloc/country_bloc_bloc.dart';
import 'package:country_list/src/features/country_list/presentation/pages/save_country_screen.dart';
import 'package:country_list/src/features/country_list/presentation/save_country/save_country_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/country_entity.dart';
import '../widgets/text_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late CountryBloc countryBloc;
  late SaveCountryBloc saveCountryBloc;
  TextEditingController editingController = TextEditingController();
  double height = 0.0;
  double width = 0.0;

  @override
  void initState() {
    countryBloc = getItInstance<CountryBloc>();
    saveCountryBloc = getItInstance<SaveCountryBloc>();
    countryBloc.add(CountryLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    countryBloc.close();
    // saveCountryBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => countryBloc,
        ),
        BlocProvider(
          create: (context) => saveCountryBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const BuildText(
            text: StringConstants.countryList,
            color: AppColor.white,
            weight: FontWeight.w900,
            fontSize: Sizes.dimen_16,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SaveCountryScreen(),
                    ),
                  );
                },
                child: const BuildText(
                  text: StringConstants.saveData,
                  color: AppColor.white,
                ))
          ],
        ),
        body: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryLoaded) {
              final countryData = state.countries;
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 4,
                ),
                child: ListView.builder(
                  itemCount: countryData.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: AppColor.royalBlue.withOpacity(0.1),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(width)),
                            child: Padding(
                              padding: EdgeInsets.all(height),
                              child: BuildText(
                                text: countryData[index].name,
                                color: AppColor.white,
                                fontSize: Sizes.dimen_20,
                                overFlow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width)),
                          color: AppColor.royalBlue.withOpacity(0.1),
                          child: IconButton(
                            onPressed: () {
                              showCupertinoAlertDialog(
                                context: context,
                                title: StringConstants.edit,
                                controller: editingController
                                  ..text = countryData[index].name,
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void showCupertinoAlertDialog(
      {required BuildContext context,
      required String title,
      required TextEditingController controller}) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: BuildText(
            text: title,
          ),
          content: TextFormField(
            controller: editingController,
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const BuildText(
                text: StringConstants.save,
              ),
              onPressed: () {
                BlocProvider.of<SaveCountryBloc>(context).add(
                  CountrySaveEvent(
                    CountryEntity(
                      name: editingController.text,
                    ),
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
