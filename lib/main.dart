//import 'package:ecommerce/login_screen.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

/*
widget Text parameter data , style 
widget TextStyle paramter : color wl contenu bibliot fha color blue 
*/
/*
    widget Majuscule car nom de classe 
    The variable name 'AfficheText' isn't a lowerCamelCase identifier. exmple : afficheText
*/

var afficheText = const Text(
  "Hello Word",
  style: TextStyle(
    color: Colors.blue,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  ),
);
var afficheIcon = Icon(
  Icons.settings,
  color: Colors.red,
  size: 40,
);
var affichePlusieursText = const Text.rich(
  TextSpan(
      text: "Hello \t World!",
      style: TextStyle(
        color: Colors.purple,
        fontSize: 35,
        fontWeight: FontWeight.w500,
      ),
      children: [
        TextSpan(
            text: " \nthis\t is\t a\t Text!",
            style: TextStyle(
              color: Colors.purple,
              fontSize: 30,
            )),
        TextSpan(
          text: "\nWidget.",
        )
      ]),
);

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (value) => print("success"),
  );
  runApp(
    MaterialApp(
      home: LoginScreen(),
    ),
  );
}
