import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_stock/screens/login_screen.dart';
import 'package:meal_stock/screens/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 57,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6e8d3c)),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Image(image: AssetImage('images/logo_rbg.png')),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            ElevatedButton(
              onPressed: () {
                HapticFeedback.selectionClick();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: const Color(0xffedd9a4),
                minimumSize: Size(width * 0.8, 50.0),
              ),
              child: const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4e652a),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 29)),
            ElevatedButton(
              onPressed: () {
                HapticFeedback.selectionClick();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: const Color(0xffedd9a4),
                minimumSize: Size(width * 0.8, 50.0),
              ),
              child: const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4e652a),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
