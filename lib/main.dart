import 'package:flutter/material.dart';
import 'home.dart'; // Import the Home widget from the home.dart file

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    theme: ThemeData(
      primaryColor: Colors.blue,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          textStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold, // Make the button text bold
          ),
        ),
      ),
    ),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (username == 'assembayumi' && password == '123456') {
      // Navigate to the home screen upon successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'AI Predictor',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold, // Make the title bold
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.white, // Set label text color
                    fontWeight: FontWeight.bold, // Make label text bold
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.white, // Set label text color
                    fontWeight: FontWeight.bold, // Make label text bold
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                ),
                obscureText: true,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  _errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold, // Make error message text bold
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  // Navigate to the password reset page.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PasswordResetPage()),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color:
                        Colors.white, // Set text color for "Forgot Password?"
                    fontWeight: FontWeight.bold, // Make text bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordResetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your email address to reset your password.',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold, // Make text bold
              ),
            ),
            SizedBox(height: 20.0),
            // Add a TextFormField for email input and a "Reset Password" button.
            // Implement the logic to send a password reset email when the button is pressed.
          ],
        ),
      ),
    );
  }
}
