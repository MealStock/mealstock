import 'package:flutter/material.dart';

class SocialsScreen extends StatefulWidget {
  const SocialsScreen({super.key});
  @override
  State<SocialsScreen> createState() => _SocialsScreenState();
}

class _SocialsScreenState extends State<SocialsScreen> {
  bool recommended = false;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Socials",
          style: TextStyle(fontSize: 26),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
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
                    "Following",
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
                    "Recommended",
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
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius:
                                BorderRadius.circular(50), // Zaoblení rohů
                          ),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 50,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    CircleAvatar(
                                      child: Text(index.toString()),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    )
                                  ],
                                );
                              }),
                        )),
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
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                          left: 120,
                          right: 120,
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,

                              borderRadius:
                                  BorderRadius.circular(20), // Zaoblení rohů
                            ),
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "+",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black),
                                )))),
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
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent,
                            borderRadius:
                                BorderRadius.circular(20), // Zaoblení rohů
                          ),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 50,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(
                                              20), // Zaoblení rohů
                                        ),
                                        child: Column(
                                          children: [
                                            const Placeholder(
                                              fallbackHeight: 105,
                                              fallbackWidth: 135,
                                            ),
                                            Text(
                                              "Meal name " + index.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            )
                                          ],
                                        )),
                                  ),
                                );
                              }),
                        )),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
