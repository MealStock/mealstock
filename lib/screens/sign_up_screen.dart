import 'package:flutter/material.dart';
import 'package:meal_stock/services/auth.dart';
import 'package:meal_stock/widgets/logo_widget.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final auth = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: true),
        body: ListView(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(),
                const Padding(padding: EdgeInsets.all(16.0)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: const Icon(Icons.visibility)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordController2,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Confirm password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure2 = !_isObscure2;
                            });
                          },
                          icon: const Icon(Icons.visibility)),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                ElevatedButton(
                  onPressed: () {
                    if (passwordController.text.trim() !=
                        passwordController2.text.trim()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Passwords don't match"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    // if password is too short (<6 characters)
                    if (passwordController.text.trim().length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Password is too short (min. 6 chars))"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    auth
                        .signUp(emailController.text.trim(),
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
                  child: Text('Sign up',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: Size(width * 0.8, 50.0)),
                ),
                const Padding(padding: EdgeInsets.only(top: 17)),
                ElevatedButton.icon(
                  onPressed: () {
                    //auth.signInWithGoogle();
                  },
                  icon: const Icon(Icons.login), // change to google logo TODO
                  label: Text('Sign up with Google',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: Size(width * 0.8, 50.0)),
                ),
              ],
            ),
          ),
        ]));
  }
}
