import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_stock/screens/home_screens/socials_screen.dart';
import 'home_screen.dart';
import 'mealplan_screen.dart';
import 'profil_screen.dart';
import 'recipes_screen.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key, required this.user});
  final User user;
  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int _selectedIndex = 0;
  int appbartextIndex = 0;
  bool searchbar = false;
  final TextEditingController searchcontroller = TextEditingController();

  final List<Widget> _screens = [
    const HomeScreen(),
    const SocialsScreen(),
    const RecipesScreen(),
    const MealplanScreen(),
    const ProfilScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      appbartextIndex = index;
      if (appbartextIndex == 1) {
        searchbar = true;
      } else {
        searchbar = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(249, 10, 250, 106),
        fixedColor: const Color.fromARGB(248, 126, 115, 0),
        unselectedItemColor: const Color.fromARGB(255, 50, 175, 0),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Socials",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Recipes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Mealplan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
