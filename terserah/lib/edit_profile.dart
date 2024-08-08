import 'package:flutter/material.dart';
import 'package:terserah/profile.dart';

class UbahProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ubah Profil',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: UbahProfilWidget(),
    );
  }
}

class UbahProfilWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 241, 239, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(236, 241, 239, 1),
        title: Text('Ubah Profil'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Edit foto',
              style: TextStyle(color: Colors.teal),
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama",
                  style: TextStyle(
                    color: Color.fromRGBO(65, 139, 140, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Masukan nama anda",
                      fillColor: Color.fromRGBO(230, 230, 230, 1),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tanggal lahir",
                  style: TextStyle(
                    color: Color.fromRGBO(65, 139, 140, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Masukan tanggal lahir anda",
                      fillColor: Color.fromRGBO(230, 230, 230, 1),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Domisili",
                  style: TextStyle(
                    color: Color.fromRGBO(65, 139, 140, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Masukan domisili anda",
                      fillColor: Color.fromRGBO(230, 230, 230, 1),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status",
                  style: TextStyle(
                    color: Color.fromRGBO(65, 139, 140, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: "Masukan email anda",
                      fillColor: Color.fromRGBO(230, 230, 230, 1),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                      ),
                    ),
                    items: ['Single', 'Married', 'Other']
                        .map((status) => DropdownMenuItem(
                      value: status,
                      child: Text(status),
                    ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    color: Color.fromRGBO(65, 139, 140, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Masukan email anda",
                      fillColor: Color.fromRGBO(230, 230, 230, 1),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kata sandi",
                  style: TextStyle(
                    color: Color.fromRGBO(65, 139, 140, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Masukan kata sandi anda",
                      fillColor: Color.fromRGBO(230, 230, 230, 1),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Container(
              height: 50,
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: Text(
                  'Simpan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), backgroundColor: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
