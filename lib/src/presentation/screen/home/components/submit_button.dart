import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/src/core/di/injection.dart';
import 'package:flutter_challenge/src/core/route/route_constants.dart';
import 'package:flutter_challenge/src/presentation/screen/home/components/countrydropdown/cubit/country_cubit.dart';
import 'package:flutter_challenge/src/presentation/screen/home/components/statedropdown/cubit/state_cubit.dart';
import 'package:flutter_challenge/src/presentation/screen/home/cubit/homepage_cubit.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomepageCubit, HomePageState>(
        listenWhen: (prev, current) {
          return prev.formValidated != current.formValidated;
        },
        builder: (ctx, _) {
          return AnimatedOpacity(
            opacity: (_.formValidated ?? false) ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  final countryCubit = getIt<CountryCubit>();
                  final stateCubit = getIt<StateCubit>();
                  Navigator.pushNamed(
                    context,
                    routeDetails,
                    arguments: {
                      "country": countryCubit
                          .getCountryById(_.selectedCountryId ?? -1),
                      "state": stateCubit.getStateById(_.selectedStateId ?? -1)
                    },
                  );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor)),
                child: Text(
                  "Submit",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          );
        },
        listener: (ctx, _) {});
  }
}
