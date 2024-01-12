import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_1/Auth_Controller.dart';


class signuppage extends StatelessWidget {
  const signuppage({super.key});

  @override
  Widget build(BuildContext context) {

    var emailController =TextEditingController();
    var passwordController = TextEditingController();

    List images = [
      "g.png",
      "t.png",
      "f.png"
    ];

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                'User Sign Up',
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
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
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
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              RichText(
                  text:TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                      text: "Have an account?",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[500]
                      )
                  )
              ),
              SizedBox(height: 24,),
              RichText(text:TextSpan(
                text: "Sign up using any of these",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16
                ),
              )
              ),
              Wrap(
                children: List<Widget>.generate(
                    3,
                        (index){
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white54,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                                "assets/"+images[index]
                            ),
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),

    );

  }
}