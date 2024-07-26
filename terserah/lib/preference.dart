import 'package:flutter/material.dart';

void main() {
  runApp(MyAppPreference());
}

class MyAppPreference extends StatelessWidget {
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

  void _nextStep() {
    setState(() {
      if (_currentStep < 3) { // Update to the total number of steps - 1
        _currentStep++;
      }
    });
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return Column(
          children: [
            Text('Umur kamu berapa?'),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOptionButton('12-20'),
                _buildOptionButton('21-45'),
                _buildOptionButton('> 46'),
              ],
            ),
            SizedBox(height: 30),
            Text('Apa gender kamu?'),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOptionButton('Cowo'),
                _buildOptionButton('Cewe'),
              ],
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            Text('Status kamu apa nih?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOptionButton('Jomblo'),
                _buildOptionButton('Pacaran'),
                _buildOptionButton('Menikah'),
                _buildOptionButton('Berkeluarga'),
              ],
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            Text('Kamu lebih suka beraktivitas dimana?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOptionButton('Indoor'),
                _buildOptionButton('Outdoor'),
              ],
            ),
          ],
        );
      case 3:
        return Column(
          children: [
            Text('Domisili kamu sekarang'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Ketik lokasi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.location_on),
              label: Text('Gunakan lokasi terkini'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildOptionButton(String text) {
    return Container(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(), backgroundColor: Colors.teal,
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF1EF), // Set background color here
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 180,
                color: Color(0xFFECF1EF), // Match background color
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/terserah_logo.png', height: 80),
                      SizedBox(height: 15),
                      Text('Kenalin diri kamu yuk!'),
                    ],
                  ),
                ),
              ),
              // Main content area with space for progress bar and form
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 400, // Set the desired width here
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: LinearProgressIndicator(
                              value: (_currentStep + 1) / 4, // Update the value based on the total steps
                              backgroundColor: Colors.grey[300],
                              color: Colors.teal,
                              minHeight: 6.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        _buildStepContent(),
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
              padding: EdgeInsets.all(16),
              color: Color(0xFFECF1EF),
              child: ElevatedButton(
                onPressed: _nextStep,
                child: Text('Selanjutnya'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
