import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenewsapp/cubit/states.dart';
import 'package:thenewsapp/ui/screens/business_screen.dart';
import 'package:thenewsapp/ui/screens/science_screen.dart';
import 'package:thenewsapp/ui/screens/settings_screen.dart';
import 'package:thenewsapp/ui/screens/sports_screen.dart';

class NewCubit extends Cubit<NewStates> {
  NewCubit() : super(InitialState());

  static NewCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen(),
  ];

  void changeBottomBarIndex(int index) {
    currentIndex = index;
    emit(BottomNaveState());
  }
}
