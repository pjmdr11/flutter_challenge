import 'package:flutter_challenge/src/core/route/route_constants.dart';
import 'package:flutter_challenge/src/presentation/screen/details/region_details.dart';
import 'package:flutter_challenge/src/presentation/screen/home/home_page.dart';

var routeMap = {
  routeRoot: (ctx) => const HomePage(),
  routeDetails: (ctx) => const RegionSelectionDetailsPage()
};
