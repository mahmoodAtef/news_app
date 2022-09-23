import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/network/dio.dart';
import 'home.dart';
import 'package:news_app/layout/cubit/cubit.dart';

void main() {
  BlocOverrides.runZoned(
    (){},
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext  context )=> NewsCubit()..getPoliticsData()..getScienceData()..getTechnologyData() ,
        child: BlocConsumer<NewsCubit , NewsAppStates >(listener: (context , state){} , builder: (context , state){
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  color: Colors.white,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              cardTheme: CardTheme(shadowColor: Colors.black),
              scaffoldBackgroundColor: Colors.white,
            ),
            darkTheme: ThemeData
              (
                scaffoldBackgroundColor: Colors.grey[900],
                appBarTheme: (AppBarTheme(
                    color: Colors.grey.shade900,
                    elevation: 0 ,iconTheme: IconThemeData(color: Colors.white),
                    titleTextStyle: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20))),
                cardTheme: CardTheme(shadowColor: Colors.white ,elevation:10,color: Colors.white ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.grey[900],
                    selectedItemColor: Colors.deepOrange,
                    selectedLabelStyle: (TextStyle(color: Colors.deepOrange)),
                    selectedIconTheme: IconThemeData(color: Colors.deepOrange),
                    unselectedItemColor: Colors.white)),
            themeMode: NewsCubit.get(context).isdark == false ? ThemeMode.light : ThemeMode.dark,
            home: HomeScreen(),
          );
        } ,),
    ) ;

  }
}
//BlocProvider(create: (BuildContext  context )=> NewsCubit() ,
//         child: BlocConsumer<NewsCubit , NewsAppStates>(listener: (context , state){} , builder: (context , state){
//           return ;
//         } ,),
//     ) ;
