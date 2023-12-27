import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 50,
        ),
        Image.network(
          "https://th.bing.com/th/id/R.ff0eaae0fc935172c93af920793b6fa2?rik=9kSqd2uVqZ4XaQ&riu=http%3a%2f%2fwww.contromet.in%2fimages%2fMichel-Dalle.jpg&ehk=aIDEQBDsOdtTUTfnKPRkEcYTD9vV6JplF%2bZ33Zh4Pc4%3d&risl=&pid=ImgRaw&r=0",
          height: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Name",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: const Text(
              "Description \n \n ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(onPressed: () {}, child: const Text("Stats button")),
        const SizedBox(
          height: 50,
        ),
        TextButton(onPressed: () {}, child: const Text("Your recipes"))
      ],
    );
  }
}
