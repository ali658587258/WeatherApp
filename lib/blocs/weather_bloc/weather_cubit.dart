import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/service/dio_helper/dio_helper.dart';
import 'package:weather/service/dio_helper/dio_helper_keys.dart';
import '../../models/weather.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  static WeatherCubit get(context)=>BlocProvider.of(context);
  TextEditingController textSearch = TextEditingController();
  Weather?weather;

  getDate() {
    emit(WeatherGetDataLoading());
    DioHelper.getData(
        url: 'weather',
        query: {'appid': apikey.weatherkey, 'q': textSearch.text.toString()})
        .then((value) {
      emit(WeatherGetDataSuccess());
      weather = Weather.fromJson(value.data);


    }).catchError((e) {
      emit(WeatherGetDataError());
      print('Excibtion $e');
    });
  }
  String photoUrl(){
    if (weather!.main!.temp!.toInt()-273 >= 20)
    {
      return 'assets/sunny.jpg';
    }
    else{
      return 'assets/Low Drifting Snow.jpg';
    }
  }

}
