
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

 int currentIndex = 0;

 List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'sports',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.science,
            ),
            label: 'science',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings
            ),
            label: 'settings',
          ),
 ];
 List <Widget> screens = [
   BusinessScreen(),
   SportsScreen(),
   ScienceScreen(),
   SettingsScreen(),

 ];





 void changeBottomNavBar (int index){
   currentIndex = index;
   emit(NewsBottomNavState());
 }
}
