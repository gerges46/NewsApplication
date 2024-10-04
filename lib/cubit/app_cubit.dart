import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/business/screens/business_screen.dart';
import 'package:newsapplication/cubit/app_satate.dart';
import 'package:newsapplication/network/local/cache_helper.dart';
import 'package:newsapplication/network/remote/dio_helper.dart';
import 'package:newsapplication/science/screens/science_screen.dart';

import 'package:newsapplication/sports/screens/sports_screen.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    //  BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
    if (currentIndex == 1) {
      getSports();
    }
    if (currentIndex == 2) {
      getScience();
    }
  }

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    //  SettingsScreen(),
  ];
  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsBussinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'ef0d1d4fb25a423bb6368e6d81681451',
    }).then((value) {
      //   print(value.data['articles'][0]['title']);

      business = value.data['articles'];
      print(business);

      emit(NewsGetBussinessSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBussinessErrorState(error: error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': 'ef0d1d4fb25a423bb6368e6d81681451',
      }).then((value) {
        //   print(value.data['articles'][0]['title']);

        sports = value.data['articles'];
        print(sports);

        emit(NewsGetSportsSucessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error: error.toString()));
      });
    } else {
      emit(NewsGetSportsSucessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': 'ef0d1d4fb25a423bb6368e6d81681451',
      }).then((value) {
        //   print(value.data['articles'][0]['title']);

        science = value.data['articles'];
        print(science);

        emit(NewsGetScienecSucessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error: error));
      });
    } else {
      emit(NewsGetScienecSucessState());
    }
  }

  // theme mode change
  bool isDark = false;

  void changeTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeThemeModeState());
    } else {
      isDark = !isDark;
      // shared prefernce
      ChacheHelper.putBool(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeThemeModeState());
      });
    }
  }
// search method
  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsSearchLoadingState());
    search = [];

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'q': '$value',
      'apiKey': 'ef0d1d4fb25a423bb6368e6d81681451',
    }).then((value) {
      //   print(value.data['articles'][0]['title']);

      search = value.data['articles'];
      print(search);

      emit(NewsGetSearchSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error: error));
    });

   
  }
}
