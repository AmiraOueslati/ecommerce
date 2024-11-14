import 'package:ecommerce/core/helpers/app_regex.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final keyForm = GlobalKey<FormState>();

  TextEditingController NomController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  void showPassword() {
    setState(() {
      obscureText = !obscureText;
      print('obscureText ======> $obscureText');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            // top: 10,
            left: 14,
            right: 14,
          ),
          child: Form(
            key: keyForm,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "metropolis.medium.",
                      fontSize: 34,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/images/gps.jpg',
                    width: 280,
                    height: 160,
                  ),
                  Align(
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: "metropolis.medium.",
                          color: Colors.grey,
                        ),
                        hintText: "Tapez votre nom et prénom",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.blue)),
                    controller: NomController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nom is required ";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: "metropolis.medium.",
                          color: Colors.grey,
                        ),
                        hintText: "Tapez votre Email",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.blue)),
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required ";
                      } else if (!AppRegex.isEmailValid(value)) {
                        return "Email is not valid";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: "metropolis.medium.",
                          color: Colors.grey,
                        ),
                        hintText: "Tapez votre mot de passe",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.blue),
                        suffixIcon: IconButton(
                          onPressed: () {
                            showPassword();
                          },
                          icon: Icon(
                             obscureText ?  Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                        )),
                    obscureText: obscureText,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required ";
                      } else if (value.length <
                          8 /*&& !AppRegex.isPasswordValid*/) {
                        return "Password mus be > 8 et il faut avoir au moi un caractere majuscule";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: "metropolis.medium.",
                          color: Colors.grey,
                        ),
                        hintText: "Tapez de nouveau le mot de passe",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.blue),
                        suffixIcon: IconButton(
                          onPressed: () {
                             showPassword();
                          },
                          icon: Icon(
                           obscureText ?  Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                        )),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 54, 108, 244),
                      fixedSize: Size(343, 42),
                      // padding: EdgeInsets.symmetric(
                      //   horizontal: 100,
                      //   vertical: 20,
                      // ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      print('email : $emailController');
                      print("email value ${emailController.text}");
                      print('email : $passwordController');
                      print("email value ${passwordController.text}");
                      print('email : $NomController');
                      print("email value ${NomController.text}");
                      if (keyForm.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Sign Up',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
