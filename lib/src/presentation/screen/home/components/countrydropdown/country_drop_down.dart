import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/src/core/di/injection.dart';
import 'package:flutter_challenge/src/data/models/location_model.dart';
import 'package:flutter_challenge/src/presentation/screen/home/components/countrydropdown/cubit/country_cubit.dart';
import 'package:flutter_challenge/src/presentation/screen/home/cubit/homepage_cubit.dart';
import 'package:flutter_challenge/src/presentation/widgets/custom_error_widget.dart';
import 'package:flutter_challenge/src/presentation/widgets/custom_loader.dart';

class CountryDropdown extends StatelessWidget {
  const CountryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageCubit homepageCubit = getIt();
    return BlocConsumer<CountryCubit, CountryState>(
        builder: (_, state) {
          if (state is CountryLoading) {
            return const CustomLoader(
              key: ValueKey("country_loader"),
            );
          } else if (state is CountryError) {
            return CustomErrorWidget(callbackListener: () {
              CountryCubit countryCubit = getIt();
              countryCubit.fetchCountries();
            });
          } else if (state is CountryFetchSuccess) {
            return BlocConsumer<HomepageCubit, HomePageState>(
                listenWhen: (prev, current) {
                  return prev.selectedCountryId != current.selectedCountryId;
                },
                builder: (_, dropDownState) {
                  return DropdownMenu(
                    key: const ValueKey("country_dropdown"),
                    initialSelection: dropDownState.selectedCountryId,
                    label: const Text("Select Country"),
                    onSelected: (int? id) {
                      homepageCubit.setSelectedCountryId(id ?? -1);
                      FocusScope.of(context).unfocus();
                    },
                    requestFocusOnTap: true,
                    expandedInsets: const EdgeInsets.all(0),
                    enableSearch: true,
                    enableFilter: true,
                    leadingIcon: Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    menuHeight: 300,
                    dropdownMenuEntries:
                        List.generate(state.countries?.length ?? 0, (index) {
                      LocationModel model = state.countries![index];
                      String countryName = model.value ?? "";
                      int countryId = model.id ?? -1;
                      return DropdownMenuEntry(
                          style: MenuItemButton.styleFrom(
                              foregroundColor: Colors.black),
                          value: countryId,
                          label: countryName);
                    }),
                  );
                },
                listener: (ctx, state) {});
          } else {
            return Container();
          }
        },
        listener: (ctx, state) {});
  }
}
