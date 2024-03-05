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
        title: const Text(
          "Mealplan",
          style: TextStyle(fontSize: 26),
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
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12), // Zaoblení rohů
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 30, top: 30),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12), // Zaoblení rohů
                    ),
                    child: const Text(
                      "Generate",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 75,
                right: 75,
              ),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(12), // Zaoblení rohů
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Filter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black),
                      )))),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      _currentPage - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Text(
                    "Saved",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green,
                        backgroundColor:
                            recommended ? Colors.transparent : Colors.yellow),
                  )),
              TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      _currentPage + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Text(
                    "Yours",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green,
                        backgroundColor:
                            recommended ? Colors.yellow : Colors.transparent),
                  ))
            ],
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
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius:
                                  BorderRadius.circular(10), // Zaoblení rohů
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "       Mealplan",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
                Container(
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                    "Jirkos tam nic neměl",
                    style: TextStyle(color: Colors.white),
                  )),
                )
              ]))
        ],
      ),
    );
  }
}
