import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/costs_bloc.dart';
import '../blocs/events/tab_event.dart';
import '../blocs/profile_bloc.dart';
import '../models/states/costs_state.dart';
import '../models/states/profile_state.dart';
import 'costs_page.dart';
import 'profile_page.dart';
import '../blocs/tab_bloc.dart';
import '../models/app_tab.dart';
import '../models/states/tab_state.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(builder: (context, tabState) {
      return Scaffold(
        body: tabState.activeTab == AppTab.costs
            ? BlocBuilder<CostsBloc, CostsState>(
                builder: (context, costsState) {
                return CostsPage(
                  date: costsState.date,
                );
              })
            : BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, profileState) {
                return ProfilePage(
                    isSave: profileState.isSave,
                    isLoading: false,
                    imageFile: profileState.imageFile);
                }),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => context
              .read<TabBloc>()
              .add(TabRequested(AppTab.values[index])),
          currentIndex: AppTab.values.indexOf(tabState.activeTab),
          items: AppTab.values.map((tab) {
            return BottomNavigationBarItem(
              icon: Icon(
                tab == AppTab.costs
                    ? Icons.library_books_outlined
                    : Icons.person,
              ),
              label: tab == AppTab.costs ? 'Расходы' : 'Профиль',
            );
          }).toList(),
        ),
      );
    });
  }
}
