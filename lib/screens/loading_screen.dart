import 'package:clima/services/location.dart';
import 'package:clima/services/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';



const apiKey ='f351a86a7a570edafd3f9f5d352e6daf';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  //LifeCycle: Initial;
  @override
  void initState() {
    getLocationData();
    super.initState();
    
  }

  //LifeCycle: Build;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulse(
          color: Colors.blue,
          size: 100.0,
        ),
      ),
    );
  }
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    Network networkHelper = Network('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(locationWeather: weatherData)));
  }
}
