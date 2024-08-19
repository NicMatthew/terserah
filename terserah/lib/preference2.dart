import 'package:flutter/material.dart';
import 'package:terserah/home.dart';
import 'package:terserah/swipe_activites.dart';

void main() {
  runApp(MyAppPreference2());
}

class MyAppPreference2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserInfoScreen(),
    );
  }
}

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  int _currentStep = 0;
  int? _selectedButtonIndex;

  void _nextStep() {
    setState(() {
      if (_currentStep < 2) {
        _currentStep++;
      }
    });
  }

  Widget _buildOptionButtonWithImage({
    required String imagePath,
    required double size,
    required int index,
  }) {
    bool isSelected = _selectedButtonIndex == index;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: isSelected ? Border.all(
            color: Color.fromRGBO(123, 210, 210, 1), width: 3.0) : null,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedButtonIndex = index;
          });
        },
        child: Image.asset(
          imagePath,
          width: size,
          height: size,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(65, 139, 140, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required String text,
    required double size,
    required int index,
  }) {
    bool isSelected = _selectedButtonIndex == index;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: isSelected ? Border.all(
            color: Color.fromRGBO(123, 210, 210, 1), width: 3.0) : null,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedButtonIndex = index;
          });
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: Color.fromRGBO(65, 139, 140, 1),
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mood kamu lagi gimana nih?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(65, 139, 140, 1),
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildOptionButtonWithImage(
                          imagePath: 'assets/Expression1.png',
                          size: 110,
                          index: 1),
                      SizedBox(width: 20),
                      _buildOptionButtonWithImage(
                          imagePath: 'assets/Expression2.png',
                          size: 110,
                          index: 2),
                      SizedBox(width: 20),
                      _buildOptionButtonWithImage(
                          imagePath: 'assets/Expression3.png',
                          size: 110,
                          index: 3),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildOptionButtonWithImage(
                          imagePath: 'assets/Expression4.png',
                          size: 110,
                          index: 4),
                      SizedBox(width: 20),
                      _buildOptionButtonWithImage(
                          imagePath: 'assets/Expression5.png',
                          size: 110,
                          index: 5),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      case 1:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: Column(
                children: [
                  Text(
                    'Sendiri atau bareng yang lain?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(65, 139, 140, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOptionButton(text: 'Sendiri', size: 110, index: 6),
                _buildOptionButton(text: 'Bareng', size: 110, index: 7),
              ],
            ),
          ],
        );
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              child: Column(
                children: [
                  Text(
                    'Rekomendasinya mau gimana?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(65, 139, 140, 1),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Spesifik akan memberitahu sampai detail lokasi, jika umum hanya akan diberikan kategorinya",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(65, 139, 140, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOptionButton(text: 'Spesifik', size: 120, index: 8),
                _buildOptionButton(text: 'Umum', size: 120, index: 9),
              ],
            ),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF1EF),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 180,
                color: Color(0xFFECF1EF),
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/terserah_logo.png', height: 80),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: LinearProgressIndicator(
                    value: (_currentStep + 1) / 3,
                    backgroundColor: Colors.grey[300],
                    color: Colors.teal,
                    minHeight: 6.0,
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Added to create space between the progress bar and content
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        _buildStepContent(),
                        SizedBox(height: 150),
                        // Add extra space at the bottom if needed
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20), // Adjusted padding
              color: Color(0xFFECF1EF),
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentStep ==
                          2) { // Updated to reflect correct step count
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SwipeCardDemo()),
                        );
                      } else {
                        _nextStep();
                      }
                    },
                    child: Text('Selanjutnya'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(65, 139, 140, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
