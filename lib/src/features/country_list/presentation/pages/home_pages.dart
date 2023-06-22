import 'package:country_list/src/common/screenUtils/size_config.dart';
import 'package:country_list/src/common/themes/theme_color.dart';
import 'package:country_list/src/dependency_injection/get_it.dart';
import 'package:country_list/src/features/country_list/presentation/country_bloc/country_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/text_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late CountryBloc countryBloc;
  double height = 0.0;
  double width = 0.0;

  @override
  void initState() {
    SizeConfig().init(context);

    countryBloc = getItInstance<CountryBloc>();
    countryBloc.add(CountryLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    countryBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => countryBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            "Country List",
            style: TextStyle(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryLoaded) {
              final countryData = state.countries;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ListView.builder(
                  itemCount: countryData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.green,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BuildText(
                              text: countryData[index].name,
                              color: AppColor.white,
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit))),
                        ],
                      ),
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
}
