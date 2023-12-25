import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meal_stock/services/auth.dart';
import 'package:meal_stock/models/user.dart';
import 'package:meal_stock/screens/home_screen.dart';
import 'package:meal_stock/screens/welcome_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: auth.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user != null ? HomeScreen(user: user) : const WelcomeScreen();
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
