import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/weather cubit/weather_cubit.dart';
import '../../models/wheather_model.dart';

class DataSuccess extends StatelessWidget {
  const DataSuccess({super.key, required this.wheatherData});

  final WeatherModel wheatherData;
  @override
  Widget build(BuildContext context) {
    String str = wheatherData.date;
    var arr = str.split(' ');

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context)
                    .weatherModel!
                    .getThemeColor(),
        title: const Text('Weather'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'search_page');
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              wheatherData.getThemeColor(),
              wheatherData.getThemeColor()[300]!,
              wheatherData.getThemeColor()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(flex: 6),
            Text(
              BlocProvider.of<WeatherCubit>(context).cityName ?? 'Null',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text('Updated at : ${arr[1]}',
                style: const TextStyle(fontSize: 16, color: Colors.black54)),
            const Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(wheatherData.getImage()),
                Text(
                  '${wheatherData.temp.toInt()}',
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      'MaxTemp :  ${wheatherData.maxTemp.toInt()}',
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    Text(
                      'MinTemp : ${wheatherData.minTemp.toInt()}',
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(flex: 1),
            Text(
              wheatherData.weatherStateName,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
