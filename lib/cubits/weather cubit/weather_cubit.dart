import 'package:weather_using_bloc/cubits/weather%20cubit/weather_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_using_bloc/models/wheather_model.dart';
import 'package:weather_using_bloc/services/wheather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  WheatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWheather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
