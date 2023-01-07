import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/blocs/weather_bloc/weather_cubit.dart';
import '../components/weather_item.dart';
import '../src/app_colors.dart';

class WeatherScreen extends StatelessWidget {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xff9bc4ec), Color(0xffb5d2f1)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<WeatherCubit,WeatherState>(builder: (context,state){
      var cubit = WeatherCubit.get(context);

      return cubit.weather == null?
          Center(
            child: CircularProgressIndicator(),
          ):
        Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${cubit.photoUrl()}'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(cubit.weather!.name!,style: TextStyle(fontSize: 36),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    '${cubit.weather!.main!.temp!.toInt()-273}',
                                    style: TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()..shader = linearGradient,
                                    ),
                                  ),
                                ),
                                Text(
                                  'o',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()..shader = linearGradient,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Image.network(
                                cubit.weather!.iconUrl,
                              ),
                              Text(
                                '${cubit.weather!.weather!.single.main}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),

                      Container(
                        width: size.width,
                        height: 130,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border:Border.all(color: Colors.white),
                          color: Colors.indigo.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              weatherItem(
                                text: 'Wind Speed',
                                value: cubit.weather!.wind!.speed!.toInt(),
                                unit: 'km/h',
                                imageUrl: 'assets/windspeed.png',
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: weatherItem(
                                    text: 'Humidity',
                                    value: cubit.weather!.main!.humidity!,
                                    unit: '',
                                    imageUrl: 'assets/humidity.png'),
                              ),
                              weatherItem(
                                text: 'Temp Min',
                                value: cubit.weather!.main!.tempMin!.toInt()-273,
                                unit: 'C',
                                imageUrl: 'assets/max-temp.png',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),
          )
        );
    }, listener: (context,state){});
  }
}

