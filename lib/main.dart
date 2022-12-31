import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipad_carplay/color_schemes.g.dart';
import 'package:ipad_carplay/map_bloc/map_bloc.dart';
import 'package:ipad_carplay/screens/home_screen.dart';
import 'package:kakaonavi/kakaonavi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),

      themeMode: ThemeMode.dark,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MapBloc(),
          ),
          BlocProvider(
            create: (context) => NaviBloc(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
