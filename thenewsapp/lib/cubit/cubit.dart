import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenewsapp/cubit/states.dart';
import 'package:thenewsapp/ui/screens/business_screen.dart';
import 'package:thenewsapp/ui/screens/science_screen.dart';
import 'package:thenewsapp/ui/screens/sports_screen.dart';

import '../helpers/dio_helpers.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

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
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomBarIndex(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsBottomNaveState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        "country": "eg",
        "category": "business",
        "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
      },
    ).then((value) {
      business = value.data["articles"];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      debugPrint("Error getting data $error");
      emit(NewsGetBusinessErrorState(error));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country": "eg",
          "category": "sports",
          "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
        },
      ).then((value) {
        sports = value.data["articles"];
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        debugPrint("Error getting data $error");
        emit(NewsGetSportsErrorState(error));
      });
    } else {
      debugPrint("data already loaded");
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScineceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country": "eg",
          "category": "science",
          "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
        },
      ).then((value) {
        science = value.data["articles"];
        emit(NewsGetScineceSuccessState());
      }).catchError((error) {
        debugPrint("Error getting data $error");
        emit(NewsGetScienceErrorState(error));
      });
    } else {
      debugPrint("data already loaded");
      emit(NewsGetScineceSuccessState());
    }
  }
}
