import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';  // Make sure to import the main file to use HomeScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool visible1 = false;
  bool visible2 = false;
  bool visible3 = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    _navigateToHome();
  }

  _startAnimation() async {
    while (mounted) {
      setState(() {
        visible1 = true;
        visible2 = false;
        visible3 = false;
      });
      await Future.delayed(Duration(milliseconds: 500));

      setState(() {
        visible1 = false;
        visible2 = true;
        visible3 = false;
      });
      await Future.delayed(Duration(milliseconds: 500));

      setState(() {
        visible1 = false;
        visible2 = false;
        visible3 = true;
      });
      await Future.delayed(Duration(milliseconds: 500));
    }
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomeScreen()),
        //
        // );
        Navigator.pushNamed(context, '/preferencestart');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFECF1EF), // Background color similar to your image
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/terserah_logo.png', height: 150), // Adjust height as needed
              SizedBox(height: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: visible1 ? Color(0xFF418B8C) : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: visible2 ? Color(0xFF418B8C) : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: visible3 ? Color(0xFF418B8C) : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
