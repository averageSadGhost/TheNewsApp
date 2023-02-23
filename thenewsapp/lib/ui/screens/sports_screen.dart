import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../components/article_item.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        List list = cubit.sports;
        return ConditionalBuilder(
          condition: state is! NewsGetSportsLoadingState,
          builder: (contex) => ListView.separated(
            itemBuilder: (context, index) {
              return buildArticleItem(list[index]);
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(color: Colors.grey),
              );
            },
            itemCount: cubit.sports.length,
          ),
          fallback: (contex) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
