import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecondaryNumbersScreen(),
    );
  }
}

class SecondaryNumbersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F2A2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Secondary Numbers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            numberCard("+1 (555) 987-6543", "Home • Added 2mo ago"),
            SizedBox(height: 20),
            numberCard("+44 20 7123 4567", "Work • Unverified"),
          ],
        ),
      ),
    );
  }

  Widget numberCard(String number, String subtitle) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF123232),
        borderRadius: BorderRadius.circular(20),
          boxShadow: [
  BoxShadow(
    color: Colors.white.withOpacity(0.2),
    offset: Offset(0, 8),
    blurRadius: 15,
  ),
  BoxShadow(
    color: Colors.white.withOpacity(0.1),
    offset: Offset(0, 2),
    blurRadius: 5,
  ),
],
      ),
      child: Row(
        children: [
          // Phone Icon Circle
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
            child: Icon(Icons.phone, color: Colors.white70),
          ),

          SizedBox(width: 15),

          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  number,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(subtitle, style: TextStyle(color: Colors.white54)),
              ],
            ),
          ),

          // Edit & Delete Icons
          Row(
            children: [
              Icon(Icons.edit, color: Colors.white70),
              SizedBox(width: 15),
              Icon(Icons.delete, color: Colors.white70),
            ],
          ),
        ],
      ),
    );
  }
}
