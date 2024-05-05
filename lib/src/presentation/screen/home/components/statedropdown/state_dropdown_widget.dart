import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/src/core/di/injection.dart';
import 'package:flutter_challenge/src/data/models/location_model.dart';
import 'package:flutter_challenge/src/presentation/screen/home/components/statedropdown/cubit/state_cubit.dart';
import 'package:flutter_challenge/src/presentation/screen/home/cubit/homepage_cubit.dart';
import 'package:flutter_challenge/src/presentation/widgets/custom_loader.dart';

class StateDropDownWidget extends StatelessWidget {
  const StateDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageCubit homepageCubit = getIt();
    return BlocConsumer<StateCubit, LocationState>(
        builder: (context, state) {
          if (state is StatesLoading) {
            return const CustomLoader(
              key: ValueKey("state_loader"),
            );
          } else if (state is StatesFetchSuccess) {
            return BlocConsumer<HomepageCubit, HomePageState>(
                listenWhen: (prev, current) {
                  return prev.selectedStateId != current.selectedStateId;
                },
                builder: (ctx, _) {
                  return DropdownMenu(
                    key: const ValueKey("state_dropdown"),
                    initialSelection: _.selectedStateId,
                    label: const Text("Select State"),
                    onSelected: (int? id) {
                      homepageCubit.setSelectedStateId(id ?? -1);
                      FocusScope.of(context).unfocus();
                    },
                    requestFocusOnTap: false,
                    expandedInsets: const EdgeInsets.all(0),
                    enableSearch: true,
                    enableFilter: true,
                    leadingIcon: Icon(
                      Icons.location_city,
                      color: Theme.of(context).primaryColor,
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    menuHeight: 300,
                    dropdownMenuEntries:
                        List.generate(state.states?.length ?? 0, (index) {
                      LocationModel model = state.states![index];
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
                listener: (ctx, _) {});
          } else if (state is StatesFetchError) {
            return Container();
          } else {
            return Container();
          }
        },
        listener: (ctx, _) {});
  }
}
