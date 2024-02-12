import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meal_stock/models/User.dart';
import 'package:meal_stock/screens/loading_screen.dart';

Future<NewUser> testserveru(context) async {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoadingScreen()),
  );

  var req1 = http.Request("post", Uri.http('13.53.253.154:8000', '/register'));
  req1.body =
      '{"iduser":"generatedByFirebaseAuth", "username":"Rustatano", "firstname":"Jakub", "lastname":"Svoboda", "email":"jakub.svoboda111@gmail.com", "phone":"731607018", "gender":"male", "bio":"", "weight":57.0, "height":180.0, "mealscore":0.0, "photo_user_idphoto_user":1}';
  var bek1 = await req1.send();
  print("body: ${await bek1.stream.bytesToString()}");
  NewUser user;

  var req2 = http.Request(
      "post",
      Uri.http('ec2-13-53-253-154.eu-north-1.compute.amazonaws.com:8000',
          '/profile'));
  req2.body = '{"token":"generatedByFirebaseAuth"}';
  var bek2 = await req2.send();
  user = NewUser.fromJson(await bek2.stream.bytesToString());
  Navigator.pop(context);
  return user;
}
