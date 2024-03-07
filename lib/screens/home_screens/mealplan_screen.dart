import 'package:flutter/material.dart';

class MealplanScreen extends StatefulWidget {
  const MealplanScreen({super.key});
  @override
  State<MealplanScreen> createState() => _MealplanScreenState();
}

class _MealplanScreenState extends State<MealplanScreen> {
  bool recommended = false;

  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Mealplan",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Container(
                  width: 90,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xffced4b2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff695b36),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  width: 90,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xffced4b2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Generate",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff695b36),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: const Color(0xffe7cb82),
                borderRadius: BorderRadius.circular(12), // Zaoblení rohů
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Filter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff4e652a),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double buttonWidth = constraints.maxWidth / 2;
              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    left: _currentPage == 0 ? 44 : buttonWidth + 46,
                    width: _currentPage == 0 ? 95 : 88,
                    height: 55,
                    top: -3,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        color: Color(0xffe4d1a1),
                        child: SizedBox(
                          height: 30,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _currentPage = 0;
                          });
                          _pageController.animateToPage(
                            _currentPage,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: Text(
                          "Saved",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _currentPage = 1;
                          });
                          _pageController.animateToPage(
                            _currentPage,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: Text(
                          "Yours",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                  recommended = !recommended;
                });
              },
              children: <Widget>[
                ListView(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 75,
                        decoration: BoxDecoration(
                          color: const Color(0xffced4b2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Text(
                              "Mealplan",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.open_in_new_rounded,
                                color: Color(0xff4e652a),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_rounded,
                                color: Color(0xff4e652a),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 75,
                        decoration: BoxDecoration(
                          color: const Color(0xffced4b2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Text(
                              "Mealplan",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.open_in_new_rounded,
                                color: Color(0xff4e652a),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_rounded,
                                color: Color(0xff4e652a),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
