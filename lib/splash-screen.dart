import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home-screen.dart';



class CounterSplashScreen extends StatefulWidget {
  const CounterSplashScreen({super.key});

  @override
  State<CounterSplashScreen> createState() => _CounterSplashScreenState();
}
class _CounterSplashScreenState extends State<CounterSplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      // naviagtion
      //  Navigator.push(context, route)
      Get.to(()=>CounterApp());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Column(
        children: [
          Spacer(), // Pushes content below towards the center
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('lib/assets/countericon.png'),
                  height: 150,
                ),
                SizedBox(height: 10), // Adds spacing between image and text
                Text(
                  'Counter App',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Spacer(), // Pushes the name to the bottom of the screen
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Developed by Muhammad Asghar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
