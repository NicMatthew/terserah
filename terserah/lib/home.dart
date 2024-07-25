import 'package:flutter/material.dart';

void main() {
  runApp(MyAppHome());
}

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Spacer(),
                Center(
                  child:Text(
                    'Lokasi Saya\nPantai Indah Kapuk',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Icon(Icons.person, color: Colors.grey),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 75), // Add padding here
              child: Text(
                'Hai, Mitiuw!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 75), // Add padding here
              child: Text(
                'Kamu mau ngapain hari ini?',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,

                children: [
                  CategoryButton(
                    imagePath: 'assets/semua_category.png',
                    label: 'Semua',
                    onTap: () {},
                  ),
                  CategoryButton(
                    imagePath: 'assets/makan_category.png',
                    label: 'Makan',
                    onTap: () {},
                  ),
                  CategoryButton(
                    imagePath: 'assets/olahraga_category.png',
                    label: 'Olahraga',
                    onTap: () {},
                  ),
                  CategoryButton(
                    imagePath: 'assets/rekreasi_category.png',
                    label: 'Rekreasi',
                    onTap: () {},
                  ),
                  SizedBox.shrink(),
                  CategoryButton(
                    imagePath: 'assets/me_time.png',
                    label: 'Me time',
                    onTap: () {},
                  ),
                  SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  CategoryButton({
    required this.imagePath,
    required this.label,
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
              shape: BoxShape.circle,
              color: Colors.teal,
            ),
            padding: EdgeInsets.all(20),
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}
