import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/cubit/app_cubit.dart';
import 'package:newsapplication/cubit/app_satate.dart';
import 'package:newsapplication/home_layout.dart';
import 'package:newsapplication/network/local/cache_helper.dart';
import 'package:newsapplication/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
await  ChacheHelper.init();
bool isDark=ChacheHelper.getBool(key: 'isDark');
  runApp( MyApp( isDark));
}

class MyApp extends StatelessWidget {
  const MyApp(this.isDark,{super.key});
  final isDark;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()..changeTheme(fromShared: isDark),
        child: BlocConsumer<NewsCubit, NewsState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                // dark theme
                darkTheme: ThemeData(
                  scaffoldBackgroundColor: HexColor('333739'),
                  primarySwatch: Colors.deepOrange,
                  floatingActionButtonTheme:
                      const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange,
                  ),
                
                  useMaterial3: false,
                  textTheme:  TextTheme(
                      bodyMedium:const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    
                           bodySmall: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                       ),
                          
                          ),
                            
                  appBarTheme: AppBarTheme(
                    titleSpacing: 20,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: HexColor('333739'),
                          statusBarIconBrightness: Brightness.light),
                      iconTheme: const IconThemeData(color: Colors.white),
                      backgroundColor: HexColor('333739'),
                      elevation: 10,
                      titleTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrange,
                      unselectedItemColor: Colors.grey[200],
                      elevation: 30,
                      backgroundColor: HexColor('333739')),
                ),
                themeMode:NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,

                // light theme
                theme: ThemeData(
                    primarySwatch: Colors.deepOrange,
                    floatingActionButtonTheme:
                        const FloatingActionButtonThemeData(
                      backgroundColor: Colors.deepOrange,
                    ),
                    scaffoldBackgroundColor: Colors.white,
                    useMaterial3: false,
                    textTheme: const TextTheme(
                       bodySmall: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                       ),
                        bodyMedium: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
                    appBarTheme: const AppBarTheme(
                      titleSpacing: 20,
                        systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: Colors.white,
                            statusBarIconBrightness: Brightness.dark),
                        iconTheme: IconThemeData(color: Colors.black),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: Colors.deepOrange,
                        elevation: 30,
                        unselectedItemColor: Colors.grey,
                        backgroundColor: Colors.white)),
                home: const HomeLayout(),
              );
            },
            listener: (context, state) {}));
  }
}
