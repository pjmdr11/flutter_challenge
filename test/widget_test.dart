// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/main.dart';
import 'package:flutter_challenge/src/core/constants/mock_responses.dart';
import 'package:flutter_challenge/src/core/di/injection.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:injectable/injectable.dart';

void main() async {
  setUpAll(() async {
    await dotenv.load(fileName: ".env.dev");
    configureInjection(Environment.test);
  });

  testWidgets('App Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    //Checks loading widget for
    final countryLoader = find.byKey(const ValueKey("country_loader"));
    expect(countryLoader, findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    final countryDropDown = find.byKey(const ValueKey("country_dropdown"));
    expect(countryDropDown, findsOneWidget);
    await tester.tap(countryDropDown);
    await tester.pumpAndSettle();

    const country = "United States";
    final countryDropDownItem = find.text(country).last;
    await tester.ensureVisible(countryDropDownItem);
    await tester.pumpAndSettle();
    await tester.tap(countryDropDownItem);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    final stateLoader = find.byKey(const ValueKey("state_loader"));
    expect(stateLoader, findsOneWidget);
    // final stateDropDown = find.byKey(const ValueKey("state_dropdown"));
    // expect(stateDropDown, findsOneWidget);
  });
}
