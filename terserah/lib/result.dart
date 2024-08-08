import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Text(
                    "Hore!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 30),
                  Image.asset(
                    'assets/images/result.png',
                    height: 100,
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Text(
                        "Kamu berhasil menemukan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                        ),
                      ),
                      Text(
                        "makanan yang cocok",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(65, 139, 140, 1),
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Kembali ke Beranda"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Text(
              "Untuk kamu beli Nasi Padang",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(65, 139, 140, 1),
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/images/food.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text("Nasi Padang"),
                      subtitle: Text("Rp 15.000"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
