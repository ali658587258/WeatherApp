part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class WeatherGetDataSuccess extends WeatherState{}
class WeatherGetDataError extends WeatherState{}
class WeatherGetDataLoading extends WeatherState{}

