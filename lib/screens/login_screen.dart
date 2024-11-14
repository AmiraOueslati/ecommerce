import 'package:ecommerce/core/helpers/app_regex.dart';
import 'package:ecommerce/core/theme/styles.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final keyForm = GlobalKey<FormState>();

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
      //r   backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 14,
          right: 14,
        ),
        child: Form(
          key: keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Login', style: TextStyles.font34BlackBold),

              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/gps.jpg',
                width: 180,
                height: 160,
              ),

              // espace entre login et email
              SizedBox(
                height: 73,
              ),
              //widget input text saisir text : email pssword
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: "metropolis.medium",
                    color: Colors.grey,
                  ),
                  hintText: "Tapez votre email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                ),
                obscureText: false,
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
                      fontFamily: "metropolis.medium",
                      color: Colors.grey,
                    ),
                    hintText: "Tapez votre password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
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
                  } else if (value.length < 8) {
                    return "Password mus be > 8";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              // row : axe horizontal
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot your password?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "metropolis.medium",
                      fontSize: 14,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 141,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  print('email : $emailController');
                  print("email value ${emailController.text}");
                  if (keyForm.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  'Login',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: "You Don’t have an account ?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: " Sign up",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          //Navigator.pop();
                          ..onTap = () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              ),
                        /*
          
                              int add (int a , int b){
                              return a+b;
                          
                              }
                              / fonction anonymes : sans nom 
                              () => 
                              (){}
                              */
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
