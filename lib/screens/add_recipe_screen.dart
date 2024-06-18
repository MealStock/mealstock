import 'package:flutter/material.dart';

class AddRecipeScreen extends StatefulWidget {
  List<String> ingredients = [];
  List<String> mealNames = [];
  AddRecipeScreen(
      {super.key, required this.ingredients, required this.mealNames});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final TextEditingController _mealName = TextEditingController();
  final TextEditingController _ingredients = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: const Color(0xff4e652a),
        ),
        title: Text(
          "Add recipe",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          const SizedBox(
            height: 12,
          ),
          const Center(
            child: Text(
              "Meal name",
              style: TextStyle(
                color: Color(0xff4e652a),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              //height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: const Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xff5e7933),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: _mealName,
                decoration: const InputDecoration(
                  hintText: "Enter Meal Name...",
                  hintStyle: TextStyle(
                    color: Color(0xff4e652a),
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 15,
                    bottom: 11,
                    top: 11,
                    right: 15,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Text(
              "Ingredients",
              style: TextStyle(
                color: Color(0xff4e652a),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                color: const Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xff5e7933),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: _ingredients,
                decoration: const InputDecoration(
                  hintText: "Enter Ingredients...",
                  hintStyle: TextStyle(
                    color: Color(0xff4e652a),
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 15,
                    bottom: 11,
                    top: 11,
                    right: 15,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                widget.ingredients.add(_ingredients.text);
                widget.mealNames.add(_mealName.text);
                _ingredients.clear();
                _mealName.clear();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffedd9a4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Add Recipe",
                style: TextStyle(
                  color: Color(0xff4e652a),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
