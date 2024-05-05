import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/src/core/di/injection.dart';
import 'package:flutter_challenge/src/core/route/route_config.dart';
import 'package:flutter_challenge/src/core/route/route_constants.dart';
import 'package:flutter_challenge/src/core/styles/app_theme.dart';
import 'package:flutter_challenge/src/presentation/bloc_listener.dart';
import 'package:flutter_challenge/src/presentation/screen/home/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

void main() async {
  await dotenv.load(fileName: (kDebugMode) ? ".env.dev" : ".env");
  configureInjection(kDebugMode ? Environment.dev : Environment.prod);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge',
      theme: AppTheme.getAppTheme(),
      initialRoute: routeRoot,
      routes: routeMap,
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
