import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/src/core/di/injection.dart';
import 'package:flutter_challenge/src/presentation/screen/home/components/countrydropdown/country_drop_down.dart';
import 'package:flutter_challenge/src/presentation/screen/home/components/countrydropdown/cubit/country_cubit.dart';
import 'package:flutter_challenge/src/presentation/screen/home/components/statedropdown/cubit/state_cubit.dart';
import 'package:flutter_challenge/src/presentation/screen/home/components/statedropdown/state_dropdown_widget.dart';
import 'package:flutter_challenge/src/presentation/screen/home/components/submit_button.dart';
import 'package:flutter_challenge/src/presentation/screen/home/cubit/homepage_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Please select your region"),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<HomepageCubit>(create: (_) => getIt<HomepageCubit>()),
            BlocProvider<CountryCubit>(create: (_) {
              CountryCubit cubit = getIt();
              cubit.fetchCountries();
              return cubit;
            }),
            BlocProvider<StateCubit>(create: (_) => getIt<StateCubit>())
          ],
          child: const Padding(
            padding: EdgeInsets.all(32.0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CountryDropdown(),
                  SizedBox(
                    height: 40,
                  ),
                  StateDropDownWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  SubmitButton()
                ],
              ),
            ),
          ),
        ));
  }
}
