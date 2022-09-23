import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components.dart';
import 'package:vector_math/vector_math_lists.dart';
import '../network/dio.dart';
class ScienceScreen extends StatelessWidget {

Map listmodel = {'urlToImage':'https://gate.ahram.org.eg/Media/News/2019/11/30/19_2019-637107135866666954-666.jpg','title': 'title of article','publishedAt' :'date','name':'publisher'};


  @override
  Widget build(BuildContext context) {

    return BlocConsumer <NewsCubit ,NewsAppStates>(listener: (context ,state) {},
      builder: (context , state){
      var list = NewsCubit.get(context).science;
      print (list.toString());
      return ListView.separated( itemBuilder: (context, index) => articleBuilder(list[index], context), separatorBuilder: (context, index) => Container(height: 1,), itemCount: list.length)
      ;
    }, );
  }
}

