import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenewsapp/cubit/cubit.dart';
import 'package:thenewsapp/cubit/states.dart';
import 'package:thenewsapp/ui/components/article_item.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        List list = cubit.business;
        return ConditionalBuilder(
            condition: state is! NewsGetBusinessLoadingState,
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
                  itemCount: cubit.business.length,
                ),
            fallback: (contex) => const Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }
}
