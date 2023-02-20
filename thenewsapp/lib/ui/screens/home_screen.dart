import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenewsapp/cubit/cubit.dart';
import 'package:thenewsapp/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext contex) => NewCubit(),
      child: BlocConsumer<NewCubit, NewStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewCubit cubit = NewCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("NewsApp"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                const SizedBox(width: 10)
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomBarIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
