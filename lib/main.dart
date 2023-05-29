import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_using_bloc/cubits/weather%20cubit/weather_cubit.dart';
import 'package:weather_using_bloc/pages/views/home_page.dart';
import 'package:weather_using_bloc/pages/views/search_page.dart';
import 'package:weather_using_bloc/services/wheather_service.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => WeatherCubit(WheatherService()),
      child: const WheatherApp(),
    ),
  );
}

class WheatherApp extends StatelessWidget {
  const WheatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      home: const HomePage(),
      routes: routes,
    );
  }
}

final Map<String, WidgetBuilder> routes = {
  'home_page': (BuildContext context) => const HomePage(),
  'search_page': (BuildContext context) => const SearchPage(),
};
