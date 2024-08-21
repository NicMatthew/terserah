import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

import 'home.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _confettiController.play(); // Start the confetti animation when the page is loaded
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: Stack(
        children: [
          Padding(
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyAppHome(),),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(65, 139, 140, 1),
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Kembali ke Beranda"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16), // Adjusted value for spacing
                Text(
                  "Untuk kamu beli Nasi Padang",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(65, 139, 140, 1),
                  ),
                ),
                SizedBox(height: 8), // Adjusted value for spacing
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          height: 120, // Reduced height for the card
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/images/rmpadang.png',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                            "RM Masakan Padang Uda Uni, Abdul Syukur ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color.fromRGBO(65, 139, 140, 1),
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " 4.5",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Color.fromRGBO(65, 139, 140, 1),
                                            ),
                                          ),
                                          TextSpan(
                                            text: "/5",
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12,
                                              color: Color.fromRGBO(65, 139, 140, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Color.fromRGBO(65, 139, 140, 1),
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            "Jl. Abdul Syukur No. 10, Margadana, Tegal",
                                            style: TextStyle(
                                              color: Color.fromRGBO(65, 139, 140, 1),
                                              fontSize: 12,
                                            ),
                                            softWrap: true, // Ensure text wraps to the next line
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Confetti animation
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [Colors.red, Colors.green, Colors.blue, Colors.yellow],
            ),
          ),
        ],
      ),
    );
  }
}
