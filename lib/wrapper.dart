import 'package:flutter/material.dart';
import 'package:meal_stock/screens/home_screens/navigator_bar.dart';
import 'package:provider/provider.dart';
import 'package:meal_stock/services/auth.dart';
import 'package:meal_stock/models/User.dart';
import 'package:meal_stock/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context);

    return auth.user != null
        ? NavigatorBar(user: auth.user)
        : const WelcomeScreen();
  }
}
