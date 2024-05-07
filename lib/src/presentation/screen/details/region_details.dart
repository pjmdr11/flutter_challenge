import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/route/route_utils.dart';
import 'package:flutter_challenge/src/presentation/widgets/slideup_animation_widget.dart';
import 'package:lottie/lottie.dart';

class RegionSelectionDetailsPage extends StatelessWidget {
  const RegionSelectionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const initialDelay = 400;
    Map<String, dynamic> routeArgs = RouteUtils.generateRouteArguments(context);
    String country = routeArgs["country"].value;
    String state = routeArgs["state"].value;
    final shouldShowAnimation = Platform.environment.containsKey('FLUTTER_TEST');
    return Scaffold(
      key: const ValueKey("selection_details"),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shouldShowAnimation
                ? Container()
                : Center(
                    child: Lottie.asset("assets/lottie/lottie_home.json",
                        key: const ValueKey("lottie_anim"), height: 230)),
            SlideUpAnimationWidget(
              delay: initialDelay,
              child: Text(
                "Congratulations!",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SlideUpAnimationWidget(
              delay: initialDelay + 200,
              child: Text(
                "Your Location",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SlideUpAnimationWidget(
              delay: initialDelay + 400,
              child: Text(
                "$country,$state",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SlideUpAnimationWidget(
              delay: initialDelay + 600,
              child: Text(
                "have been saved.",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
