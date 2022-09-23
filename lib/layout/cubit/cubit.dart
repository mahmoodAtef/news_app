import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/politics.dart';
import 'package:news_app/network/dio.dart';
import 'package:http/http.dart' as http;
import '../../modules/technology.dart';
class NewsCubit extends Cubit <NewsAppStates>
{
  NewsCubit() : super (NewsInitState());
  static NewsCubit get (context) => BlocProvider.of(context);
int current = 0 ;
List <BottomNavigationBarItem> bottomItems = [
  BottomNavigationBarItem(icon: Icon (Icons.science_outlined), label: 'Sience'),
  BottomNavigationBarItem (icon: Icon(Icons.computer_outlined) , label: 'Technology'),
  BottomNavigationBarItem (icon : Icon (Icons.article) ,label: 'general'),
] ;
List <Widget> Screens = [ScienceScreen() ,TechnologyScreen(),PoliticsSscreen(),  ];
void Change (int index)
{
current = index ;
emit (NewsBottomNav());
}
 List   science = [] ;
late Map data ;

void getScienceData () async{
  emit (getScienseDataloadingState());
  DioHelper.getData (  url: 'v2/top-headlines'
      ,query: {'country':'eg','category':'science','apikey':'aaf8b3fc7f9c4a06befb404cb403819f'}).then((value) =>
  {
    science = value.data['articles'],
    emit (GetScienceDataSuccessState()),
print (science.toString()),

  });
  }


  List <dynamic> technology = [];
  void getTechnologyData ()async {
    emit (getScienseDataloadingState());
    DioHelper.getData (  url: 'v2/top-headlines'
        ,query: {'country':'eg','category':'technology','apikey':'aaf8b3fc7f9c4a06befb404cb403819f'}).then((value) =>
    {
      technology = value.data['articles'],
      emit (GetScienceDataSuccessState()),
      print (technology.toString()),

    });
  }
  List <dynamic> politcs = [] ;
  void getPoliticsData (){
    emit (getTechnologyDataloadingState());
    DioHelper.getData (  url: 'v2/top-headlines',query: {'country':'eg','category':'general','apikey':'aaf8b3fc7f9c4a06befb404cb403819f'}).then((value) =>
    {politcs = value.data['articles']}) ;
  }
  bool isdark = false ;
  void changeMode ()
  {

      isdark = !isdark ;
      emit (ThemeModeState()) ;
  }
}
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }

}