import 'package:flutter/material.dart';
import 'package:terserah/preference.dart';
import 'package:terserah/sign_in.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Log In",
      theme: ThemeData(
        fontFamily: "Helvetica",
      ),
      home: LogInWidget(),
    );
  }
}

class LogInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      body: Center(
        child: Container(
          width: 350,
          height: 500,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                      "assets/terserah_logo.png",
                      width: 140,
                    ),
                ),
                SizedBox(height: 30),
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
                SizedBox(height: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
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
                          hintText: "Masukan password anda",
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
                SizedBox(height: 20,),
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
                        MaterialPageRoute(builder: (context) => MyAppPreference()),
                      );
                    },
                    child: Text(
                      "Masuk",
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
                        "Belum memiliki akun?",
                        style: TextStyle(
                          color: Color.fromRGBO(154, 154, 154, 1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        },
                        child: Text(
                          "Daftar",
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
