import 'package:flutter/material.dart';

class RouteUtils {
  static RouteSettings? _getRouteSettings(BuildContext context) {
    return ModalRoute.of(context)?.settings;
  }

  static Map generateRouteParams(BuildContext context) {
    try {
      final settings = _getRouteSettings(context);
      final routeName = settings?.name ?? "";
      Uri routeUri = Uri.parse(routeName);
      return routeUri.queryParameters;
    } catch (e) {
      return {};
    }
  }

  static dynamic generateRouteArguments(BuildContext context) {
    final settings = _getRouteSettings(context);
    return settings?.arguments;
  }
}
