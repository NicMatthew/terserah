import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF418B8C), // Background color similar to your image
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image.asset('assets/terserah_logo.png', height: 200), // Adjust height as needed
              // SizedBox(height: 20),
              Text(
                'terserah.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF418B8C),
                ),
              ),
              SizedBox(height: 10),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF418B8C)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
