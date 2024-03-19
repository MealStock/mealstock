import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: const Color(0xff4e652a),
        ),
        title: Text(
          "Recipe",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.open_in_new_rounded,
              color: Color(0xff4e652a),
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.24,
              decoration: BoxDecoration(
                color: const Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xff5e7933),
                  width: 1,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Center(
                    child: Text(
                      "Meal name",
                      style: TextStyle(
                        color: Color(0xff4e652a),
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Color(0xff4e652a),
                              size: 28,
                            ),
                            Text(
                              "999",
                              style: TextStyle(
                                color: Color(0xff4e652a),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.chat_rounded,
                              color: Color(0xff4e652a),
                              size: 28,
                            ),
                            Text(
                              "999",
                              style: TextStyle(
                                color: Color(0xff4e652a),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.bookmark_rounded,
                              color: Color(0xff4e652a),
                              size: 28,
                            ),
                            Text(
                              "999",
                              style: TextStyle(
                                color: Color(0xff4e652a),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff5e7933),
                    child: CircleAvatar(
                      radius: 29,
                      backgroundColor: Color(0xffd9d9d9),
                      child: Text(""),
                    ),
                  ),
                  Text(
                    "User",
                    style: TextStyle(
                      color: Color(0xff4e652a),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Column(
              children: [
                Text("Ingredients:"),
                Text("lorem soblum"),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const Center(
            child: Text("lorem soblum"),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff8edd0),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          top: 8,
                        ),
                        child: Text(
                          "Today's popular recipes",
                          style: TextStyle(
                            color: Color(0xff4e652a),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 190,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/recipe');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xffedd9a4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 135,
                                  height: 105 + 9,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 135,
                                        height: 105,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffd9d9d9),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: const Color(0xff5e7933),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.bookmark_border_rounded,
                                            color: Color(0xff4e652a),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        bottom: 0,
                                        right: 5,
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Color(0xff5e7933),
                                          child: CircleAvatar(
                                            radius: 17,
                                            backgroundColor: Color(0xffd9d9d9),
                                            child: Text(""),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Meal name $index",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4e652a),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
