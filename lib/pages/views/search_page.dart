import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_using_bloc/cubits/weather%20cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cityName = '';

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            onChanged: (data) {
              cityName = data;
            },
            onFieldSubmitted: (data) async {
              cityName = data;
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;

              Navigator.pop(context);
            },
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: 'Enter City Name',
              suffixIconColor: Colors.white,
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white),
              label: const Text('city search'),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeather(cityName: cityName);

                    BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
