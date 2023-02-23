import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thenewsapp/services/dio_services.dart';
import 'package:thenewsapp/services/theme_services.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'ui/screens/home_screen.dart';
import 'ui/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DioServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            title: 'TheNewsApp',
            debugShowCheckedModeBanner: false,
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            themeMode: ThemeServices().getTheme,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
