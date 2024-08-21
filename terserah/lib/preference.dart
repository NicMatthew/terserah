import 'package:flutter/material.dart';
import 'package:terserah/home.dart';

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
  int? _selectedAgeIndex; // Variable to store age selection
  int? _selectedGenderIndex; // Variable to store gender selection

  void _nextStep() {
    setState(() {
      if (_currentStep < 3) {
        _currentStep++;
      }
    });
  }

  Widget _buildOptionButtonWithImage({required String imagePath, required double size, required int index, required int step}) {
    bool isSelected = (step == 0 && _selectedGenderIndex == index) || (step == 1 && _selectedAgeIndex == index);
    return Container(
      width: size - 10,
      height: size - 10,
      decoration: BoxDecoration(
        border: isSelected ? Border.all(color: Color.fromRGBO(123, 210, 210, 1), width: 3.0) : null,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (step == 0) {
              _selectedGenderIndex = index;
            } else {
              _selectedAgeIndex = index;
            }
          });
        },
        child: Image.asset(
          imagePath,
          width: 50,
          height: 50,
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

  Widget _buildOptionButton({required String text, required int index, double size = 100.00, required int step}) {
    bool isSelected = (step == 0 && _selectedAgeIndex == index) || (step == 1 && _selectedGenderIndex == index);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: isSelected ? Border.all(color: Color.fromRGBO(123, 210, 210, 1), width: 3.0) : null,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (step == 0) {
              _selectedAgeIndex = index;
            } else {
              _selectedGenderIndex = index;
            }
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
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20),
              Text(
                'Umur kamu berapa?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(65, 139, 140, 1),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOptionButton(text: '12-20', index: 0, step: 0),
                  _buildOptionButton(text: '21-45', index: 1, step: 0),
                  _buildOptionButton(text: '> 46', index: 2, step: 0),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Apa gender kamu?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(65, 139, 140, 1),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      _buildOptionButtonWithImage(imagePath: 'assets/male.png', size: 110, index: 3, step: 0),
                      SizedBox(height: 15),
                      Text(
                        'Cowo',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(65, 139, 140, 1),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      _buildOptionButtonWithImage(imagePath: 'assets/female.png', size: 110, index: 4, step: 0),
                      SizedBox(height: 15),
                      Text(
                        'Cewe',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(65, 139, 140, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      case 1:
        return Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Status kamu apa nih?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(65, 139, 140, 1),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOptionButton(text: 'Jomblo', index: 5, size: 120, step: 1),
                  _buildOptionButton(text: 'Pacaran', index: 6, size: 120, step: 1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOptionButton(text: 'Menikah', index: 7, size: 120, step: 1),
                  _buildOptionButton(text: 'Berkeluarga', index: 8, size: 120, step: 1),
                ],
              ),
            ],
          ),
        );
      case 2:
        return Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 260,
                child: Column(
                  children: [
                    Text(
                      'Kamu lebih suka beraktivitas dimana?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(65, 139, 140, 1),
                      ),
                    ),
                    Text(
                      "Bisa pilih lebih dari satu",
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
                  _buildOptionButton(text: 'Indoor', index: 9, size: 120, step: 1),
                  _buildOptionButton(text: 'Outdoor', index: 10, size: 120, step: 1),
                ],
              ),
            ],
          ),
        );
      case 3:
        return Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Domisili kamu sekarang',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(65, 139, 140, 1),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                  filled: true,
                  hintText: 'Ketik lokasi',
                  hintStyle: TextStyle(color: Color.fromRGBO(205, 205, 205, 100)),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Implement your location usage logic here
                  },
                  icon: Icon(Icons.location_on),
                  label: Text('Gunakan lokasi terkini'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(65, 139, 140, 1),
                    foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF1EF),
      resizeToAvoidBottomInset: false,
      body: Column(
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
                  Text(
                    'Kenalin diri kamu yuk!',
                    style: TextStyle(
                      color: Color.fromRGBO(65, 139, 140, 1),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: LinearProgressIndicator(
                        value: (_currentStep + 1) / 4,
                        backgroundColor: Colors.grey[300],
                        color: Colors.teal,
                        minHeight: 6.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded( // Gunakan Expanded untuk membatasi area yang dapat di-scroll
                    child: SingleChildScrollView(
                      child: Container(
                        height: 400,
                        child: _buildStepContent(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              color: Color(0xFFECF1EF),
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentStep == 3) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppHome()));
                      } else {
                        _nextStep();
                      }
                    },
                    child: Text('Selanjutnya'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(65, 139, 140, 1),
                      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
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
