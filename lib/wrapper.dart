import 'package:flutter/material.dart';
import 'package:meal_stock/models/user.dart' as user;
import 'package:meal_stock/screens/home_screens/navigator_bar.dart';
import 'package:provider/provider.dart';
import 'package:meal_stock/services/auth.dart';
import 'package:meal_stock/screens/welcome_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context);

    return StreamBuilder<user.User?>(
      stream: auth.user,
      builder: (BuildContext context, AsyncSnapshot<user.User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.hasData
              ? NavigatorBar(user: snapshot.data)
              : const WelcomeScreen();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
