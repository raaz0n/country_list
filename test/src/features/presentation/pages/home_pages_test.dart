import 'package:country_list/src/features/country_list/presentation/widgets/alert_dialog_widget.dart';
import 'package:country_list/src/features/country_list/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BuildText widget should display correct text',
      (WidgetTester tester) async {
    const String testText = 'Test Text';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BuildText(text: testText),
        ),
      ),
    );

    // Verify that the BuildText widget displays the correct text
    expect(find.text(testText), findsOneWidget);
  });

  testWidgets('BuildText widget should apply specified properties',
      (WidgetTester tester) async {
    const String testText = 'Test Text';
    const double testFontSize = 20;
    const FontWeight testFontWeight = FontWeight.w400;
    const Color testTextColor = Colors.black;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BuildText(
            text: testText,
            fontSize: 20,
          ),
        ),
      ),
    );

    // Verify that the BuildText widget applies the specified properties
    final textWidget = tester.widget<Text>(find.text(testText));
    expect(textWidget.style!.fontSize, testFontSize);
    expect(textWidget.style!.fontWeight, testFontWeight);
    expect(textWidget.style!.color, testTextColor);
  });

  testWidgets('showCupertinoAlertDialog displays alert dialog box',
      (WidgetTester tester) async {
    TextEditingController controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: Center(
                child: IconButton(
                  onPressed: () {
                    showCupertinoAlertDialog(
                      context: context,
                      title: 'Edit',
                      id: '123',
                      onpress: () {},
                      controller: controller,
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
              ),
            );
          },
        ),
      ),
    );

    // Simulate tapping the IconButton
    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();

    // Verify that the alert dialog is displayed
    expect(find.byType(AlertDialog), findsOneWidget);

    // Verify the title of the alert dialog
    expect(find.text('Edit'), findsOneWidget);

    // Verify the text field in the alert dialog
    expect(find.byType(TextFormField), findsOneWidget);

    // Verify the button in the alert dialog
    expect(find.text('Save'), findsOneWidget);
  });
}
