import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});
  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final PageController _pageController = PageController();

  final GlobalKey _followingKey = GlobalKey();
  final GlobalKey _recommendedKey = GlobalKey();

  double _buttonPosition = 0;
  double _buttonWidth = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _buttonPosition = _getButtonPosition(
            _pageController.page == 0 ? _followingKey : _recommendedKey);
        _buttonWidth = _pageController.page == 0 ? 95 : 88;
      });
    });
  }

  double _getButtonPosition(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    return position.dx;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Recipes",
            style: Theme.of(context).textTheme.headlineLarge,
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
          Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastEaseInToSlowEaseOut,
                left: _buttonPosition - 8,
                width: _buttonWidth,
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
                    key: _followingKey,
                    onPressed: () {
                      setState(() {
                        _buttonPosition = _getButtonPosition(_followingKey);
                        _buttonWidth = 95;
                      });
                      _pageController.animateToPage(
                        0,
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
                    key: _recommendedKey,
                    onPressed: () {
                      setState(() {
                        _buttonPosition = _getButtonPosition(_recommendedKey);
                        _buttonWidth = 88;
                      });
                      _pageController.animateToPage(
                        1,
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
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _buttonPosition = _getButtonPosition(
                          page == 0 ? _followingKey : _recommendedKey);
                      _buttonWidth = page == 0 ? 95 : 88;
                    });
                  },
                  children: <Widget>[
                ListView(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                          color: const Color(0xffe7cb82),
                          borderRadius:
                              BorderRadius.circular(12), // Zaoblení rohů
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
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/recipe');
                      },
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 120,
                                          height: 100,
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
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: const Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 26,
                                              backgroundColor:
                                                  Color(0xff5e7933),
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundColor:
                                                    Color(0xffd9d9d9),
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
                ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/recipe');
                      },
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 120,
                                          height: 100,
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
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: const Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 26,
                                              backgroundColor:
                                                  Color(0xff5e7933),
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundColor:
                                                    Color(0xffd9d9d9),
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
                )
              ]))
        ]));
  }
}
