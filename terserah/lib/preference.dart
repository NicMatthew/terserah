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

  void _nextStep() {
    setState(() {
      if (_currentStep < 3) { // Update to the total number of steps - 1
        _currentStep++;
      }
    });
  }

  Widget _buildOptionButtonWithImage({required String imagePath, required double size}) {
    return Container(
      width: size - 10,
      height: size - 10,
      child: ElevatedButton(
        onPressed: () {
          // Tambahkan logika onPressed Anda di sini
        },
        child: Image.asset(
          imagePath,
          width: 50,  // Ukuran gambar di dalam tombol, sesuaikan sesuai kebutuhan
          height: 50,  // Ukuran gambar di dalam tombol, sesuaikan sesuai kebutuhan
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
              SizedBox(height: 20,),
              Text(
                'Umur kamu berapa?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(65, 139, 140, 1),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOptionButton(text: '12-20'),
                  _buildOptionButton(text: '21-45'),
                  _buildOptionButton(text: '> 46'),
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
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      _buildOptionButtonWithImage(imagePath: 'assets/male.png', size: 110),
                      SizedBox(height: 15),  // Jarak antara gambar dan teks
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
                      _buildOptionButtonWithImage(imagePath: 'assets/female.png', size: 110),
                      SizedBox(height: 15),  // Jarak antara gambar dan teks
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
          )
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
                  _buildOptionButton(text: 'Jomblo', size: 120),
                  _buildOptionButton(text: 'Pacaran', size: 120),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOptionButton(text: 'Menikah', size: 120),
                  _buildOptionButton(text: 'Berkeluarga', size: 120),
                ],
              ),
            ],
          )
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
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOptionButton(text: 'Indoor', size: 120),
                _buildOptionButton(text: 'Outdoor', size: 120),
              ],
            ),
          ],
        )
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
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                  filled: true,
                  hintText: 'Ketik lokasi',
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {

                  },
                  icon: Icon(Icons.location_on),
                  label: Text('Gunakan lokasi terkini'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(65, 139, 140, 1),
                    foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
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
