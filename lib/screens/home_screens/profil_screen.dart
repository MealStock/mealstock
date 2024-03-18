import 'package:flutter/material.dart';
import 'package:meal_stock/services/server.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Me",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xff5e7933),
              child: CircleAvatar(
                radius: 49,
                backgroundColor: Color(0xffd9d9d9),
                child: Text(""),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Me",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff4e652a),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Id ipsum ornare ut metus. Nec amet amet amet sit. Pellentesque arcu odio consequat integer nulla ultrices. Risus gravida placerat sed tortor vel nulla nibh.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4e652a),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Following \n   999",
                      style: TextStyle(
                        color: Color(0xff4e652a),
                      ),
                    )),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Followers \n   999",
                      style: TextStyle(
                        color: Color(0xff4e652a),
                      ),
                    )),
                Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffced4b2),
                      borderRadius: BorderRadius.circular(12), // Zaoblení rohů
                    ),
                    child: TextButton(
                        onPressed: () async {
                          testserveru(context);
                          //NewUser user = await testserveru(context);
                        },
                        child: const Text(
                          "Analytics",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xff4e652a),
                          ),
                        ))),
              ],
            ),
          ],
        ));
  }
}
