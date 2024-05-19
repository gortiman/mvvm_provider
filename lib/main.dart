import 'package:flutter/material.dart';
import 'package:mvvm_provider/counter/counter_provider.dart';
import 'package:mvvm_provider/slider/sliderScreen.dart';
import 'package:mvvm_provider/slider/slider_provider.dart';
import 'package:mvvm_provider/theme_change/theme_provider.dart';
import 'package:mvvm_provider/theme_change/theme_screen.dart';
import 'package:provider/provider.dart';

import 'counter/counter_screen.dart';
import 'favourite/favourite_provider.dart';
import 'favourite/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<ThemeChangeProvider>(context);
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> CounterProvider()),
      ChangeNotifierProvider(create: (_)=> FavouriteProvider()),
      ChangeNotifierProvider(create: (_)=> SliderProvider()),
      ChangeNotifierProvider(create: (_)=> ThemeChangeProvider()),
    ],
        child: Builder(
          builder: (context) {
            final themeChanger = Provider.of<ThemeChangeProvider>(context);
            return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red,
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
              useMaterial3: false,
              // useMaterial3: true,
              // appBarTheme: AppBarTheme(
              //   // backgroundColor: Colors.green, // Set your desired AppBar color here
              //   backgroundColor: Theme.of(context).colorScheme.primary,
              // ),
            ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.purple,
                  primaryColor: Colors.green,
                  iconTheme: IconThemeData(
                    color: Colors.pink
                  )
                ),
            home:  ThemeChangeScreen()
                );
          }
        ),
    );
    // return ChangeNotifierProvider(create: (context)=> CounterProvider(),

    // );
  }
}

