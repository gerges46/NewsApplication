import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/components/article_builder.dart';

import 'package:newsapplication/cubit/app_cubit.dart';
import 'package:newsapplication/cubit/app_satate.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return ArticleBuilder(
          list: list,
        );
      },
    );
  }
}
