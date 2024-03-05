import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});
  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  bool recommended = false;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Recipes",
            style: TextStyle(fontSize: 26),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Column(children: [
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
                  ))
            ],
          ),
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
          const SizedBox(
            height: 30,
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
                        padding: const EdgeInsets.only(
                          left: 75,
                          right: 75,
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius:
                                  BorderRadius.circular(12), // Zaoblení rohů
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
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(
                            onPressed: () {},
                            child: Center(
                                child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.24,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadius.circular(10), // Zaoblení rohů
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Placeholder(
                                            fallbackHeight: 100.0,
                                            fallbackWidth: 120,
                                          ),
                                        ),
                                        Text(
                                          "Meal name",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: const Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 25,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              Text(
                                                "User",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.star,
                                                color: Colors.black,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.chat,
                                                  color: Colors.black,
                                                )),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.bookmark,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: const Text(
                                              "lorem ipsum nevim nechci to hledat",
                                              style: TextStyle(
                                                  color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                            ))
                                      ],
                                    )
                                  ]),
                            ))))
                  ],
                ),
                ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(
                            onPressed: () {},
                            child: Center(
                                child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.24,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadius.circular(10), // Zaoblení rohů
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Placeholder(
                                            fallbackHeight: 100.0,
                                            fallbackWidth: 120,
                                          ),
                                        ),
                                        Text(
                                          "Meal name",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: const Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 25,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              Text(
                                                "User",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.star,
                                                color: Colors.black,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.chat,
                                                  color: Colors.black,
                                                )),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.bookmark,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: const Text(
                                              "lorem ipsum nevim nechci to hledat",
                                              style: TextStyle(
                                                  color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                            ))
                                      ],
                                    )
                                  ]),
                            ))))
                  ],
                )
              ]))
        ]));
  }
}
