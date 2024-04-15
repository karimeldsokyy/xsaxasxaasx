import 'package:flutter/material.dart';
import 'crash.dart';
import 'bac.dart';
import 'rol.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Predictor',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Color(0xFF0A0639), // Set your desired app bar color
      ),
      backgroundColor:
          Color(0xFF2281B1), // Set your desired background color for the page
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CrashPage()),
                );
              },
              child: Container(
                width: 280,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Set your desired container color
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/crash.webp', // Replace with your actual image asset path
                    fit: BoxFit.cover, // Fit the image within the container
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BacPage()),
                );
              },
              child: Container(
                width: 280,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Set your desired container color
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/bac.webp', // Replace with your actual image asset path
                    fit: BoxFit.cover, // Fit the image within the container
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RolPage()),
                );
              },
              child: Container(
                width: 280,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Set your desired container color
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/rol.jpg', // Replace with your actual image asset path
                    fit: BoxFit.cover, // Fit the image within the container
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
