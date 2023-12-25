import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.userID});
  final userID;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 26),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 40)),
          const Text(
            "  Current mealplan",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
                onPressed: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(10), // Zaoblení rohů
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "       " + "Mealplan",
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
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
                onPressed: () {},
                child: Center(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10), // Zaoblení rohů
                  ),
                  child: const Center(
                      child: Text(
                    "Shopping list",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                ))),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                  onPressed: () {},
                  child: Center(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.24,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10), // Zaoblení rohů
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Text(
                                      "User",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
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
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: const Text(
                                    "lorem ipsum nevim nechci to hledat",
                                    style: TextStyle(color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  ))
                            ],
                          )
                        ]),
                  ))))
        ],
      ),
    );
  }
}
