import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/weather cubit/weather_cubit.dart';

class DataFailure extends StatelessWidget {
  const DataFailure({super.key});

  @override
  Widget build(BuildContext context) {
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
              Colors.blue,
              Colors.blue[300]!,
              Colors.orange[300]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Somethig went wrong 🙁',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Please Try again 🔎',
                style: TextStyle(fontSize: 14, color: Colors.yellow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
