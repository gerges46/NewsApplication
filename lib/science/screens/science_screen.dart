
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/components/article_builder.dart';

import 'package:newsapplication/cubit/app_cubit.dart';
import 'package:newsapplication/cubit/app_satate.dart';

class ScienceScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list=NewsCubit.get(context).science;
        return ArticleBuilder(list: list);
      },
    );
  }
}