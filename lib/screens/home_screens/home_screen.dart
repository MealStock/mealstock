import 'package:flutter/material.dart';
import 'package:meal_stock/services/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut();
            },
            icon: const Icon(Icons.logout_rounded),
            color: const Color(0xff4e652a),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width * 0.1) / 2),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                "Current mealplan",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          const SizedBox(height: 10),
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
          TextButton(
            onPressed: () {},
            child: Center(
              child: Container(
                height: 50,
                width: 175,
                decoration: BoxDecoration(
                  color: const Color(0xffe7cb82),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Shopping list",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.24,
                decoration: BoxDecoration(
                  color: const Color(0xffedd9a4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                width: 120,
                                height: 100,
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
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  CircleAvatar(
                                    radius: 26,
                                    backgroundColor: Color(0xff5e7933),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Color(0xffd9d9d9),
                                      child: Text(""),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    "User",
                                    style: TextStyle(
                                        color: Color(0xff4e652a),
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
                                    Icons.star_rounded,
                                    color: Color(0xff4e652a),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.chat_rounded,
                                    color: Color(0xff4e652a),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.bookmark_rounded,
                                    color: Color(0xff4e652a),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const Center(
                      child: Text(
                        "Meal name",
                        style: TextStyle(
                          color: Color(0xff4e652a),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
