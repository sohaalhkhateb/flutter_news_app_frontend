import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit2/cubit.dart';
import 'package:news_app/shared/cubit2/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'shared/styles/themes.dart';
import 'layout/news_app/cubit/cubit.dart';
//import 'package:hexcolor/hexcolor.dart';

import 'shared/network/remote/dio_helper_news.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelperNews.init();
  await CacheHelper.init();

 // databaseFactory = databaseFactorySqflitePlugin;

  bool isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));

  MyApp app = MyApp(isDark);
}

class MyApp extends StatelessWidget
{
  final bool isDark;

  const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context)
  {

    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          NewsCubit()..getBusiness()..getSports()..getScience(),),
        BlocProvider(
          create: (BuildContext context) =>
          AppCubit()..changeAppMode(isDark,),),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }

}