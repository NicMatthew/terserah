import 'package:flutter/material.dart';
import 'package:terserah/profile.dart';

class UbahProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ubah Profil',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          color: Color.fromRGBO(236, 241, 239, 1), // Warna latar belakang AppBar
          foregroundColor: Color.fromRGBO(65, 139, 140, 1), // Warna teks di AppBar
          elevation: 0, // Menghapus bayangan di AppBar
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, // Membuat teks menjadi bold
            fontSize: 22, // Ukuran font (opsional)
            color: Color.fromRGBO(65, 139, 140, 1),
          ),
        ),
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
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Color.fromRGBO(179, 211, 200, 1),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Edit foto',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            _buildTextFieldSection(
                context,
                "Nama",
                "Masukkan nama anda",
                false,
                false,
                false,
                false,
                Colors.white,
                Color.fromRGBO(65, 139, 149, 1),
                2.0
            ),
            SizedBox(height: 16.0),
            _buildTextFieldSection(
                context,
                "Tanggal lahir",
                "Masukkan tanggal lahir anda",
                false,
                false,
                false,
                false,
                Colors.white,
                Color.fromRGBO(65, 139, 149, 1),
                2.0
            ),
            SizedBox(height: 16.0),
            _buildTextFieldSection(
                context,
                "Domisili",
                "Masukkan domisili anda",
                false,
                false,
                false,
                false,
                Colors.white,
                Color.fromRGBO(65, 139, 149, 1),
                2.0
            ),
            SizedBox(height: 16.0),
            _buildDropdownSection(
                context,
                "Status",
                ['Single', 'Married', 'Other'],
                Colors.white,
                Color.fromRGBO(65, 139, 149, 1),
                2.0
            ),
            SizedBox(height: 16.0),
            _buildTextFieldSection(
                context,
                "Email",
                "Masukkan email anda",
                false,
                false,
                false,
                false,
                Colors.white,
                Color.fromRGBO(65, 139, 149, 1),
                2.0
            ),
            SizedBox(height: 16.0),
            _buildTextFieldSection(
                context,
                "Kata sandi",
                "Masukkan kata sandi anda",
                false,
                false,
                false,
                false,
                Colors.white,
                Color.fromRGBO(65, 139, 149, 1),
                2.0
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
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldSection(
      BuildContext context,
      String label,
      String hint,
      bool filled,
      bool obscureText,
      bool isDropdown,
      bool isEmail,
      Color fillColor,
      Color borderColor,
      double borderWidth
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color.fromRGBO(65, 139, 140, 1),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 50,
          child: isDropdown
              ? DropdownButtonFormField<String>(
            decoration: InputDecoration(
              fillColor: fillColor,
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
          )
              : TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: fillColor,
              filled: filled,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownSection(
      BuildContext context,
      String label,
      List<String> items,
      Color fillColor,
      Color borderColor,
      double borderWidth
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color.fromRGBO(65, 139, 140, 1),
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 50,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              fillColor: fillColor,
              filled: false,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
            items: items
                .map((status) => DropdownMenuItem(
              value: status,
              child: Text(status),
            ))
                .toList(),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
