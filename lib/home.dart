import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/main.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/politics.dart';
import 'package:news_app/modules/technology.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
              ),
              actions: [IconButton(onPressed: () {  NewsCubit.get(context).changeMode();
                print (NewsCubit.get(context).isdark);}, icon: Icon(Icons.brightness_4_outlined))],
            ),
            body: cubit.Screens[cubit.current],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.current,
              onTap: (index) {
                cubit.Change(index);
              },
            ),
          );
        },
      );
  }
}
