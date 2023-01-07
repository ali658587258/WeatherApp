import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/weather_bloc/weather_cubit.dart';
import 'package:weather/screen/weather_screen.dart';
import 'package:weather/utils/app_navigator.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherState>(listener: (context,state){},
        builder: (context,state){
          var cubit = WeatherCubit.get(context);
      return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/weather.png',height: 500,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'City',
                        border: OutlineInputBorder(),
                        labelText: ''),
                    controller: cubit.textSearch,
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xffeee4ee)),
                        elevation: MaterialStateProperty.all(10)),
                    onPressed: () {
                      AppNavigator.navigateToNewScreen(context, WeatherScreen(), false);
                      cubit.getDate();
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
    }
    );
  }
}
