import 'package:flutter/material.dart';
import 'package:terserah/profile.dart';
import 'package:terserah/preference2.dart';

void main() {
  runApp(MyAppHome());
}

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 241, 239, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 40),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 14),
                        child: Icon(Icons.location_on, color: Color.fromRGBO(65, 139, 140, 1)),
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Lokasi Saya',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            'Pantai Indah Kapuk',
                            style: TextStyle(fontSize: 16, color: Color.fromRGBO(65, 139, 140, 1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyAppProfile()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(236, 241, 239, 1),
                      elevation: 0,
                    ),
                    child: Image.asset('assets/user-profile-circle.png'),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Text(
                  'Hai, Mitiuw!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(65, 139, 140, 1)),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Text(
                  'Kamu mau ngapain hari ini?',
                  style: TextStyle(fontSize: 35, color: Color.fromRGBO(65, 139, 140, 1)),
                ),
              ),
              SizedBox(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryButton(
                        imagePath: 'assets/semua_category.png',
                        label: 'Semua',
                        isSelected: selectedCategory == 'Semua',
                        onTap: () {
                          setState(() {
                            selectedCategory = 'Semua';
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyAppPreference2()),
                          );
                        },
                      ),
                      CategoryButton(
                        imagePath: 'assets/makan_category.png',
                        label: 'Makan',
                        isSelected: selectedCategory == 'Makan',
                        onTap: () {
                          setState(() {
                            selectedCategory = 'Makan';
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyAppPreference2()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryButton(
                        imagePath: 'assets/olahraga_category.png',
                        label: 'Olahraga',
                        isSelected: selectedCategory == 'Olahraga',
                        onTap: () {
                          setState(() {
                            selectedCategory = 'Olahraga';
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyAppPreference2()),
                          );
                        },
                      ),
                      CategoryButton(
                        imagePath: 'assets/rekreasi_category.png',
                        label: 'Rekreasi',
                        isSelected: selectedCategory == 'Rekreasi',
                        onTap: () {
                          setState(() {
                            selectedCategory = 'Rekreasi';
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyAppPreference2()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CategoryButton(
                        imagePath: 'assets/me_time.png',
                        label: 'Me time',
                        isSelected: selectedCategory == 'Me time',
                        onTap: () {
                          setState(() {
                            selectedCategory = 'Me time';
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyAppPreference2()),
                          );
                        },
                      ),
                    ],
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

class CategoryButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  CategoryButton({
    required this.imagePath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Menggunakan bentuk lingkaran
              color: Color.fromRGBO(65, 139, 140, 1),
              border: isSelected ? Border.all(color: Color.fromRGBO(123, 210, 210, 1), width: 3.0) : null,
            ),
            padding: EdgeInsets.all(30),
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: Color.fromRGBO(65, 139, 140, 1),
            ),
          ),
        ],
      ),
    );
  }
}
