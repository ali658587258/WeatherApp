import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/blocs/weather_bloc/weather_cubit.dart';
import 'package:weather/screen/home_screen.dart';
import 'package:weather/screen/weather_screen.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>WeatherCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData() ,
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
