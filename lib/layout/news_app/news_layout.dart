import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/news_cubit.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusiness()
        ..getScience()
        ..getSports(),
       
        
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('NEWS APP'),
              actions: [
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),
                 IconButton(
                  onPressed: () {
                    
                    cubit.changeAppMode();
                  },
                  icon: Icon(
                    Icons.brightness_4_outlined
                  ),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
