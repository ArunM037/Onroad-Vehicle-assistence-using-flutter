import 'dart:ui';

import 'package:application_1/Auth_Controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:application_1/Sign_up.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var emailController =TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/4235847-200.png',
                width: 339.9,
                height: 141,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'User login',
                style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),
              ),
              const Text(
                'Use the form below to get started.',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 50,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                      )
                    ]
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "email",
                      prefixIcon: Icon(Icons.email,color: Colors.black,),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                      )
                    ]
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password_outlined,color: Colors.black,),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: Container(),),
                  const Text(
                    "Forgot Password?",
                    style:TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 70,),
              GestureDetector(
                onTap: (){
                  AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
                },
                child: Container(
                  width: w*0.57,
                  height:h*0.08,
                  decoration:  BoxDecoration(
                      borderRadius:BorderRadius.circular(30),
                      image: DecorationImage(image: AssetImage(
                          "assets/blackradbtn.png"
                      ),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:w*0.2),
              RichText(text:TextSpan(
                  text: "Don\'t have an account?",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 20
                  ),
                  children: [
                    TextSpan(
                        text: " Create",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()..onTap=() => Get.to(()=>signuppage() )
                    )
                  ]
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}