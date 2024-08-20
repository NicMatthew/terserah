import 'package:flutter/material.dart';
import 'package:terserah/log_in.dart';

void main() {
  runApp(SignIn());
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Helvetica',
      ),
      home: SignInWidget(),
    );
  }
}

class SignInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menambahkan padding bawah untuk menghindari konten tertutup keyboard
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 80),
            width: 350,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1), // Latar belakang putih
              borderRadius: BorderRadius.circular(15.0), // Border radius untuk sudut membulat
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Menjaga kolom tetap di tengah secara vertikal
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: Image.asset(
                        "assets/terserah_logo.png",
                        width: 180,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextField(context, "Nama", "Masukkan nama Anda"),
                  SizedBox(height: 15),
                  _buildTextField(context, "Tanggal Lahir", "Masukkan tanggal lahir Anda"),
                  SizedBox(height: 15),
                  _buildTextField(context, "Domisili", "Masukkan domisili Anda"),
                  SizedBox(height: 15),
                  _buildTextField(context, "Email", "Masukkan email Anda"),
                  SizedBox(height: 15),
                  _buildTextField(context, "Kata Sandi", "Masukkan kata sandi Anda", obscureText: true),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                      backgroundColor: Color.fromRGBO(65, 139, 140, 1),
                      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Sudah punya akun?",
                        style: TextStyle(
                          color: Color.fromRGBO(154, 154, 154, 1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn()),
                          );
                        },
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(65, 139, 140, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, String hint, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color.fromRGBO(65, 139, 140, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 40,
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: Color.fromRGBO(240, 240, 240, 1), // Ubah warna latar belakang di sini
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
