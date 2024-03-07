import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_stock/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final auth = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xfffffbf0),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.0),
                  child: Image(image: AssetImage('images/logo_rbg.png')),
                ),
                const Padding(padding: EdgeInsets.all(16.0)),
                const Padding(padding: EdgeInsets.all(16.0)),
                SizedBox(
                  width: width * 0.9,
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      fillColor: Color(0xffD9D9D9),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.21),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: width * 0.9,
                  child: TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      fillColor: const Color(0xffD9D9D9),
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.21),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: const Icon(Icons.visibility),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    HapticFeedback.selectionClick();
                    auth
                        .signIn(emailController.text.trim(),
                            passwordController.text.trim())
                        .then((value) {
                      if (auth.error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(auth.error!),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      Navigator.pop(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffedd9a4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: Size(width * 0.8, 50.0)),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4e652a),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 17)),
                ElevatedButton.icon(
                  onPressed: () {
                    HapticFeedback.selectionClick();
                    auth.signInWithGoogle().then((value) {
                      if (auth.error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(auth.error!),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      Navigator.pop(context);
                    });
                  },
                  icon: Image.asset(
                    'images/google.png',
                    width: 25,
                    height: 25,
                  ),
                  label: const Text(
                    'Log in with Google',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4e652a),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffedd9a4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: Size(width * 0.8, 50.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
