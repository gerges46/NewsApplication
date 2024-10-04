abstract class NewsState {}

class InitialState extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewsBussinessLoadingState extends NewsState {}

class NewsGetBussinessSucessState extends NewsState {}

class NewsGetBussinessErrorState extends NewsState {
  final String error;

  NewsGetBussinessErrorState({required this.error});
}

class NewsSportsLoadingState extends NewsState {}

class NewsGetSportsSucessState extends NewsState {}

class NewsGetSportsErrorState extends NewsState {
  final String error;

  NewsGetSportsErrorState({required this.error});
}

class NewsScienceLoadingState extends NewsState {}

class NewsGetScienecSucessState extends NewsState {}

class NewsGetScienceErrorState extends NewsState {
  final String error;

  NewsGetScienceErrorState({required this.error});
}

class NewsSearchLoadingState extends NewsState {}

class NewsGetSearchSucessState extends NewsState {}

class NewsGetSearchErrorState extends NewsState {
  final String error;

  NewsGetSearchErrorState({required this.error});
}

class NewsChangeThemeModeState extends NewsState {}
