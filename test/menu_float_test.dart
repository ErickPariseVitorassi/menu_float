import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'menu_float_app.dart';

const String titleWidgetTarget = 'Click me';
const String titleOptionMenu = 'Telefone';
const double landscapeWidth = 1024;
const double landscapeHeight = 768;

Widget makeTargetButton() {
  return ElevatedButton(
      onPressed: () => {}, child: const Text(titleWidgetTarget));
}

void setWindowSize(Size size) {
  TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  binding.window.physicalSizeTestValue = size;
  binding.window.devicePixelRatioTestValue = 1.0;
}

Future<void> initializeAndTapAtPosition(
    WidgetTester tester, double x, double y, double tapX, double tapY) async {
  setWindowSize(const Size(landscapeWidth, landscapeHeight));
  final target = makeTargetButton();
  await tester.pumpWidget(MenuFloatAppTest(target: target, x: x, y: y));
  await tester.pumpAndSettle();

  await tester.tapAt(Offset(tapX, tapY));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.pump(const Duration(seconds: 3));
}

void main() {
  group('menu float: with y = 0', () {
    testWidgets('have menu for the button on top-left', (tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await initializeAndTapAtPosition(tester, 0, 0, 40, 15);

      final menu = find.text(titleOptionMenu);
      expect(menu, findsOneWidget);
    });

    testWidgets('have menu for the button on top-left', (tester) async {
      await initializeAndTapAtPosition(tester, 500, 0, 515, 15);

      final menu = find.text(titleOptionMenu);
      expect(menu, findsOneWidget);
    });

    testWidgets('have menu for the button on top-left', (tester) async {
      await initializeAndTapAtPosition(tester, 930, 0, 945, 15);

      final menu = find.text(titleOptionMenu);
      expect(menu, findsOneWidget);
    });
  });

  group('menu float top: with y = 400', () {
    testWidgets('have menu for the button on center-left', (tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await initializeAndTapAtPosition(tester, 0, 400, 40, 415);

      final menu = find.text(titleOptionMenu);
      expect(menu, findsOneWidget);
    });

    testWidgets('have menu for the button on center-left', (tester) async {
      await initializeAndTapAtPosition(tester, 500, 400, 515, 415);

      final menu = find.text(titleOptionMenu);
      expect(menu, findsOneWidget);
    });

    testWidgets('have menu for the button on center-left', (tester) async {
      await initializeAndTapAtPosition(tester, 930, 400, 945, 415);

      final menu = find.text(titleOptionMenu);
      expect(menu, findsOneWidget);
    });
  });

  group('menu float top: with y = 0', () {
    testWidgets('have menu for the button on bottom-left', (tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await initializeAndTapAtPosition(tester, 0, 730, 40, 745);

      final menu = find.text(titleOptionMenu);
      expect(menu, findsOneWidget);
    });

    testWidgets('have menu for the button on bottom-left', (tester) async {
      await initializeAndTapAtPosition(tester, 500, 730, 515, 745);

      final menu = find.text(titleOptionMenu);
      expect(menu, findsOneWidget);
    });

    testWidgets('have menu for the button on bottom-left', (tester) async {
      await initializeAndTapAtPosition(tester, 930, 730, 945, 745);

      final menu = find.text(titleOptionMenu);
      expect(menu, findsOneWidget);
    });
  });
}
