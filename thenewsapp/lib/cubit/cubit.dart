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
        "apiKey": "84f85c09fc45402ea9fed35d8d8dcc81",
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
          "apiKey": "84f85c09fc45402ea9fed35d8d8dcc81",
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
          "apiKey": "84f85c09fc45402ea9fed35d8d8dcc81",
        },
      ).then((value) {
        science = value.data["articles"];
        emit(NewsGetScineceSuccessState());
      }).catchError((error) {
        emit(NewsGetScienceErrorState(error));
      });
    } else {
      emit(NewsGetScineceSuccessState());
    }
  }
}
