import 'package:flutter/material.dart';
import 'package:meal_stock/models/user.dart';
import 'package:meal_stock/screens/home_screens/socials_screen.dart';
import 'home_screen.dart';
import 'mealplan_screen.dart';
import 'profil_screen.dart';
import 'recipes_screen.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key, required this.user});
  final User? user;
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
        fixedColor: const Color(0xff6e8d3c),
        unselectedItemColor: const Color(0xff6e8d3c),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Color(0xffedd9a4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Socials",
            backgroundColor: Color(0xffedd9a4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Recipes",
            backgroundColor: Color(0xffedd9a4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Mealplan",
            backgroundColor: Color(0xffedd9a4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
            backgroundColor: Color(0xffedd9a4),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
