import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/components/article_builder.dart';
import 'package:newsapplication/cubit/app_cubit.dart';
import 'package:newsapplication/cubit/app_satate.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return ArticleBuilder(
          list: list,
        );
      },
    );
  }
}
