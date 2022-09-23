import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/cubit/cubit.dart';
import '../layout/cubit/states.dart';
import '../shared/components.dart';

class TechnologyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NewsCubit ,NewsAppStates>(listener: (context ,state) {},
      builder: (context , state){
        var list = NewsCubit.get(context).technology;
        print (list.toString());
        return ListView.separated( itemBuilder: (context, index) => articleBuilder(list[index] ,context), separatorBuilder: (context, index) => Container(height: 1,), itemCount: list.length)
        ;
      }, );
  }
}
