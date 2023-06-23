import 'package:country_list/src/features/country_list/presentation/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/string_constants.dart';

void showCupertinoAlertDialog(
    {required BuildContext context,
    required String title,
    required String id,
    required VoidCallback onpress,
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
          controller: controller,
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onpress,
            child: const BuildText(
              text: StringConstants.save,
            ),
            //  () {
            //   BlocProvider.of<SaveCountryBloc>(context).add(
            //     CountrySaveEvent(
            //       CountryEntity(
            //         name: controller.text,
            //         id: id,
            //       ),
            //     ),
            //   );
            //   Navigator.pop(context);
            // },
          ),
        ],
      );
    },
  );
}
