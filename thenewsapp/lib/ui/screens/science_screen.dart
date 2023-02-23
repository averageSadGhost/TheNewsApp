import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../widgets/article_item.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        List list = cubit.science;
        return ConditionalBuilder(
          condition: state is! NewsGetScineceLoadingState,
          builder: (contex) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return buildArticleItem(list[index], contex);
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(color: Colors.grey),
              );
            },
            itemCount: cubit.science.length,
          ),
          fallback: (contex) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
