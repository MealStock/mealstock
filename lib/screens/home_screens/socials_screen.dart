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
        title: Text(
          "Socials",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double buttonWidth = constraints.maxWidth / 2;
              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    left: _currentPage == 0 ? 16 : buttonWidth - 8,
                    width: _currentPage == 0 ? 125 : 172,
                    height: 55,
                    top: -3,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        color: Color(
                            0xffe4d1a1), // Change this to your desired color
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
                          "Following",
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
                          "Recommended",
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
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xffe7cb82),
                          borderRadius:
                              BorderRadius.circular(50), // Zaoblení rohů
                        ),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[
                                Colors.white,
                                Colors.transparent,
                                Colors.transparent,
                                Colors.white,
                              ],
                              stops: <double>[0.02, 0.1, 0.9, 0.98],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstOut,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 25 + 2,
                            itemBuilder: (context, index) {
                              if (index == 0 || index == 25 + 1) {
                                return const SizedBox(width: 20);
                              } else {
                                return const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: CircleAvatar(
                                    radius: 26,
                                    backgroundColor: Color(0xff5e7933),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Color(0xffd9d9d9),
                                      child:
                                          Text("" /*(index - 1).toString()*/),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xffced4b2),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "+",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xff4e652a),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 190,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xfff8edd0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 50,
                            itemBuilder: (context, index) {
                              return TextButton(
                                onPressed: () {},
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
                                                  color:
                                                      const Color(0xffd9d9d9),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xff5e7933),
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
                                                    Icons
                                                        .bookmark_border_rounded,
                                                    color: Color(0xff4e652a),
                                                  ),
                                                ),
                                              ),
                                              const Positioned(
                                                bottom: 0,
                                                right: 5,
                                                child: CircleAvatar(
                                                  radius: 18,
                                                  backgroundColor:
                                                      Color(0xff5e7933),
                                                  child: CircleAvatar(
                                                    radius: 17,
                                                    backgroundColor:
                                                        Color(0xffd9d9d9),
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
                                              color: Color(0xff4e652a)),
                                        )
                                      ],
                                    )),
                              );
                            }),
                      ),
                    ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
