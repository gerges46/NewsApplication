import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/cubit/app_cubit.dart';
import 'package:newsapplication/cubit/app_satate.dart';
import 'package:newsapplication/search/search.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    if (cubit.business.isEmpty) {
      cubit.getBusiness();
    }

    return BlocConsumer<NewsCubit, NewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                onPressed: () {
                  cubit.changeTheme(); // Change theme
                },
                icon: const Icon(Icons.brightness_4_outlined),
              ),
            ],
            title: const Text("News app"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomNavigationBarItems,
          ),
        );
      },
      listener: (context, state) {
        if (state is NewsChangeThemeModeState) {
          print("theme changed");
        }
      },
    );
  }
}
