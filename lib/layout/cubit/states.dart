import 'package:flutter/material.dart';

abstract class NewsAppStates {}

class NewsInitState extends NewsAppStates {}
class NewsBottomNav extends NewsAppStates {} 

class GetScienceDataSuccessState extends NewsAppStates {}
class getScienseDataloadingState extends NewsAppStates {}
class getScienceDataErrorState extends NewsAppStates
{
  final String error;
  getScienceDataErrorState (this.error){
    print (error.toString());
  }

}

class GetTechnologyDataSuccessState extends NewsAppStates {}
class getTechnologyDataloadingState extends NewsAppStates {}
class getTechnologyDataErrorState extends NewsAppStates
{
  final String error;
  getTechnologyDataErrorState (this.error) {
    {
      print (error.toString());
    }
  }
}

class GetPoliticsDataSuccessState extends NewsAppStates {}
class getPoliticsDataloadingState extends NewsAppStates {}
class getPoliticsDataErrorState extends NewsAppStates
{
  final String error;
 getPoliticsDataErrorState (this.error) {
   print (error.toString());
 }
}
class ThemeModeState extends NewsAppStates {}