import 'package:flutter/material.dart';

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
        fontFamily: 'Helvetice',
      ),
      home: SignInWidget(),
    );
  }
}

class SignInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      body: Center(
        child: Container(
          height: 740,
          width: 350,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1), // Latar belakang putih
            borderRadius: BorderRadius.circular(15.0), // Border radius untuk sudut membulat
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 40),
                          child: Image.asset("assets/terserah_logo.png", width: 180,),
                        ),
                      ),
                      Text('Nama'),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan nama Anda',
                          fillColor: Color.fromRGBO(230, 230, 230, 1),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tanggal Lahir'),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan tanggal lahir Anda',
                          fillColor: Color.fromRGBO(230, 230, 230, 1),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Domisili'),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan domisili Anda',
                          fillColor: Color.fromRGBO(230, 230, 230, 1),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email'),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan email Anda',
                          fillColor: Color.fromRGBO(230, 230, 230, 1),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kata Sandi'),
                      SizedBox(height: 5),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Masukkan kata sandi Anda',
                          fillColor: Color.fromRGBO(230, 230, 230, 1),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30), // Increased space between last TextField and button
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle submit button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(65, 139, 140, 1), // Button background color
                      foregroundColor: Colors.white, // Button text color
                      minimumSize: Size(double.infinity, 48), // Button height smaller
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Match the TextField border radius
                      ),
                    ),
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        fontWeight: FontWeight.w700, // Font weight 700 (bold)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5), // Space between button and text
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Sudah punya akun? ',
                          style: TextStyle(
                            color: Colors.black, // Text color
                            fontWeight: FontWeight.w400, // Font weight 400 (normal)
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle login link press
                          },
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                              color: Color.fromRGBO(65, 139, 140, 1), // Link color
                              fontWeight: FontWeight.w700, // Font weight 700 (bold)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
