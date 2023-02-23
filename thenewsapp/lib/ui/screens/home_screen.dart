import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenewsapp/cubit/cubit.dart';
import 'package:thenewsapp/cubit/states.dart';
import 'package:get/get.dart';
import 'package:thenewsapp/services/theme_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext contex) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            // ignore: deprecated_member_use
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              // ignore: deprecated_member_use
              backgroundColor: context.theme.backgroundColor,
              elevation: 0,
              title: Text(
                "TheNewsApp",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
              actions: [
                SizedBox(
                  height: 50,
                  width: 55,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: context.theme.primaryColorDark,
                      size: 35,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 55,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      ThemeServices().switchTheme();
                    },
                    child: Icon(
                      Get.isDarkMode
                          ? Icons.wb_sunny_outlined
                          : Icons.nightlight_round_outlined,
                      color: context.theme.primaryColorDark,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.orange,
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                if (index == 1) {}
                cubit.changeBottomBarIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
