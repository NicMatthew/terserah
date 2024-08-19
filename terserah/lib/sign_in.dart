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
                          child: Image.asset("assets/terserah_logo.png", width: 180,),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal Lahir",
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
                SizedBox(height: 15),
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
                SizedBox(height: 15),
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
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kata Sandi",
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
                SizedBox(height: 20), // Increased space between last TextField and button
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                      backgroundColor: Color.fromRGBO(65, 139, 140, 1),
                      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
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
                ),
                Container(
                  child: Row(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
