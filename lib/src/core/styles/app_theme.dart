import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            color: Colors.teal,
            elevation: 10,
            iconTheme: IconThemeData(color: Colors.white),
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.teal),
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 24.0)),
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.teal,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
            circularTrackColor: Colors.amber, color: Colors.white),
        brightness: Brightness.light);
  }
}
