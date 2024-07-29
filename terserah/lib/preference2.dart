import 'package:flutter/material.dart';
import 'package:terserah/home.dart';

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

  void _nextStep() {
    setState(() {
      if (_currentStep < 2) { // Update to the total number of steps - 1
        _currentStep++;
      }
    });
  }

  Widget _buildOptionButtonWithImage({required String imagePath, required double size}) {
    return Container(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: () {
          // Tambahkan logika onPressed Anda di sini
        },
        child: Image.asset(
          imagePath,
          width: size,  // Ukuran gambar di dalam tombol, sesuaikan sesuai kebutuhan
          height: size,  // Ukuran gambar di dalam tombol, sesuaikan sesuai kebutuhan
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(65, 139, 140, 1),  // Sesuaikan warna tombol
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
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
              Text(
                'Mood kamu lagi gimana nih?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(65, 139, 140, 1),
                ),
              ),
              // Baris pertama dengan 3 tombol
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOptionButtonWithImage(imagePath: 'assets/Expression1.png', size: 110),
                  SizedBox(width: 40),
                  _buildOptionButtonWithImage(imagePath: 'assets/Expression2.png', size: 110),
                  SizedBox(width: 40),
                  _buildOptionButtonWithImage(imagePath: 'assets/Expression3.png', size: 110),
                ],
              ),
              // Baris kedua dengan 2 tombol
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOptionButtonWithImage(imagePath: 'assets/Expression4.png', size: 110),
                  SizedBox(width: 40),
                  _buildOptionButtonWithImage(imagePath: 'assets/Expression5.png', size: 110),
                ],
              ),
            ],
          ),
        );
      case 1:
        return Container(
            width: 300,
            child: Column(
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
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildOptionButtonWithImage(imagePath: 'assets/alone.png', size: 110),
                    _buildOptionButtonWithImage(imagePath: 'assets/together.png', size: 110),
                  ],
                ),
              ],
            )
        );
      case 2:
        return Container(
            width: 350,
            child: Column(
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
                      SizedBox(height: 10,),
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
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildOptionButton(text: 'Spesifik', size: 120),
                    _buildOptionButton(text: 'Umum', size: 120),
                  ],
                ),
              ],
            )
        );
      default:
        return Container();
    }
  }

  Widget _buildOptionButton({String text = "button", double size = 100.00}) {
    return Container(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(), backgroundColor: Color.fromRGBO(65, 139, 140, 1),
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
                              value: (_currentStep + 1) / 3, // Update the value based on the total steps
                              backgroundColor: Colors.grey[300],
                              color: Colors.teal,
                              minHeight: 6.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 400,
                          child: _buildStepContent(),
                        ),
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
              padding: EdgeInsets.symmetric(vertical: 40),
              color: Color(0xFFECF1EF),
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_currentStep==3){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppHome(),),);
                      }
                      else{
                        _nextStep();
                      }
                    },
                    child: Text('Selanjutnya'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(65, 139, 140, 1),
                      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
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
