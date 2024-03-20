import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class GenerateRecipeScreen extends StatefulWidget {
  const GenerateRecipeScreen({super.key});

  @override
  State<GenerateRecipeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GenerateRecipeScreen> {
  final TextEditingController _calorieController = TextEditingController();
  final TextEditingController _carbsController = TextEditingController();
  final TextEditingController _proteinController = TextEditingController();
  final TextEditingController _prompt = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String _generateSystemPrompt() {
    String prompt = ' Please do not repeat the prompt.';
    prompt += ' Make your response short, concise, and to the point.';
    prompt +=
        ' Structure the recipe like this: "Ingredients: ... Directions: ...".';
    prompt += ' You can also use markdown to format your response.';
    prompt += ' Do not include anything that is not a recipe.';
    return prompt;
  }

  String _generatePrompt() {
    // ignore: unnecessary_brace_in_string_interps
    String prompt =
        'Generate a recipe from the following prompt: "${_prompt.text}"';
    if (_calorieController.text.isNotEmpty) {
      prompt += ' with ${_calorieController.text} calories,';
    }
    if (_carbsController.text.isNotEmpty) {
      prompt += ' with ${_carbsController.text}g of carbs,';
    }
    if (_proteinController.text.isNotEmpty) {
      prompt += ' with ${_proteinController.text}g of protein,';
    }
    return prompt;
  }

  String _responseText = '';
  bool waitingForResponse = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> _sendPrompt() async {
    setState(() {
      _responseText = '';
      waitingForResponse = true;
    });
    final HttpClient client = HttpClient();
    final HttpClientRequest request =
        await client.postUrl(Uri.parse('http://localhost:11434/api/chat'));
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode({
      'messages': [
        {
          'role': 'system',
          'content': _generateSystemPrompt(),
        },
        {
          'role': 'user',
          'content': _generatePrompt(),
        }
      ],
      'model': 'mistral',
    }));
    final HttpClientResponse response = await request.close();
    await for (var chunk
        in response.transform(utf8.decoder).transform(const LineSplitter())) {
      final Map<String, dynamic> responseJson = jsonDecode(chunk);
      if (responseJson['message'] != null && !responseJson['done']) {
        setState(() {
          waitingForResponse = false;
          _responseText += responseJson['message']['content'];
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        });
      }
      if (responseJson['done']) {
        break;
      }
    }
  }

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
          "Generate recipe",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Text(
              "What do you want to eat today?",
              style: TextStyle(
                color: Color(0xff4e652a),
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
                controller: _prompt,
                decoration: const InputDecoration(
                  hintText: "What's on your mind?",
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
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Calorie Intake: ",
                    style: TextStyle(
                      color: Color(0xff4e652a),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xff5e7933),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _calorieController,
                        decoration: const InputDecoration(
                          hintText: "Enter calorie intake",
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
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Carbs Intake: ",
                    style: TextStyle(
                      color: Color(0xff4e652a),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xff5e7933),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _carbsController,
                        decoration: const InputDecoration(
                          hintText: "Enter carb intake",
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
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Protein Intake: ",
                    style: TextStyle(
                      color: Color(0xff4e652a),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xff5e7933),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _proteinController,
                        decoration: const InputDecoration(
                          hintText: "Enter protein intake",
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
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _sendPrompt();
                });
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
                "Generate Recipe",
                style: TextStyle(
                  color: Color(0xff4e652a),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          if (waitingForResponse)
            const Center(
              child: CircularProgressIndicator(),
            ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xffd9d9d9),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xff5e7933),
                width: 1,
              ),
            ),
            child: MarkdownBody(
              data: _responseText,
              styleSheet:
                  MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                p: const TextStyle(
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
