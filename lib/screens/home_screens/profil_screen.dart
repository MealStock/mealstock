import 'package:flutter/material.dart';
import 'package:meal_stock/services/server.dart';

import '../../models/User.dart';

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Me",
            style: TextStyle(fontSize: 26),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/R.ff0eaae0fc935172c93af920793b6fa2?rik=9kSqd2uVqZ4XaQ&riu=http%3a%2f%2fwww.contromet.in%2fimages%2fMichel-Dalle.jpg&ehk=aIDEQBDsOdtTUTfnKPRkEcYTD9vV6JplF%2bZ33Zh4Pc4%3d&risl=&pid=ImgRaw&r=0",
                  scale: 0.1),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Lorem impus\n \n ",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
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
                      "Following \n 999",
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Followers \n 999",
                      style: TextStyle(color: Colors.black),
                    )),
                Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 1, 255, 64),
                      borderRadius: BorderRadius.circular(12), // Zaoblení rohů
                    ),
                    child: TextButton(
                        onPressed: () async {
                          testserveru(context);
                          NewUser user = await testserveru(context);
                          print(user.userName);
                        },
                        child: const Text(
                          "Analytics",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ))),
              ],
            ),
          ],
        ));
  }
}
