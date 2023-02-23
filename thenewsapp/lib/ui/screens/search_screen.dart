import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:thenewsapp/ui/size_config.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../widgets/article_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        List list = cubit.search;
        return Scaffold(
          appBar: AppBar(
            // ignore: deprecated_member_use
            backgroundColor: context.theme.backgroundColor,
            iconTheme: IconThemeData(color: context.theme.primaryColor),
          ),
          body: SizedBox(
            height: SizeConfig.screenHeight,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      cubit.getSearch(value);
                    },
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "search must not be empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        focusColor: Colors.cyan,
                        border: const OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.search,
                          color: context.theme.primaryColor,
                        ),
                        label: Text(
                          "Search",
                          style: TextStyle(color: context.theme.primaryColor),
                        )),
                  ),
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: state is! NewsGetSearchLoadingState,
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
                      itemCount: cubit.search.length,
                    ),
                    fallback: (contex) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
