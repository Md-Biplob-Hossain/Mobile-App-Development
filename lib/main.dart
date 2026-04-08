import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileLayout(),
    );
  }
}

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1DE9B6), // হালকা সবুজ কালার
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "8th April 2026",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
            
              Row(
                children: [
                  Expanded(
                    flex: 3, 
                    child: Container(
                      height: 80,
                      color: const Color(0xFFFF4D4F), 
                      child: const Center(
                        child: Text(
                          "Roll: 22-CSE-037",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 80,
                      color: const Color(0xFF00C853), // সবুজ
                      child: const Center(
                        child: Text(
                          "AB+",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 80,
                      color: const Color(0xFF2196F3), // নীল
                      child: const Center(
                        child: Text(
                          "Jhenidah",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

          
              Expanded(
                child: Center(
                  child: Container(
                    width: 260,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFC107),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Reg: 110-037-22",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

         
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 40.0),
              child: Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  color: Color(0xFFE040FB), 
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    "Biplob",
                    style: TextStyle(
                      color: Colors.black, 
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}