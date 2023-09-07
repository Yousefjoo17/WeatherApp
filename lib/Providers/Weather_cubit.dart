import 'package:bloc/bloc.dart';
import 'package:weather_app/Providers/Weather_states.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  String? cityname;
  WeatherModel? weatherModel;
  Future<void> getweather({required String cityname}) async {
     emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getweather(cityname: cityname);
      emit(WeatherSuccess(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailure());
      print(e);
    }
  }
}
