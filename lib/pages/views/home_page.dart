import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_using_bloc/cubits/weather%20cubit/weather_cubit.dart';
import 'package:weather_using_bloc/cubits/weather%20cubit/weather_states.dart';
import 'package:weather_using_bloc/pages/component/no_data.dart';
import '../component/data_faluire.dart';
import '../component/data_success.dart';
import '../component/loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: Loading());
        } else if (state is WeatherSuccess) {
          return DataSuccess(wheatherData: state.weatherModel);
        } else if (state is WeatherFailure) {
          return const DataFailure();
        } else {
          return const NoData();
        }
      },
    );
  }
}
