import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:once/Auth/forgot_screen.dart';
import 'package:once/Auth/signup_screen.dart';
import 'package:once/Navbar/navbarr.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  bool pass = true;
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var email = "";
  var username = "";
  var password = "";
  bool isLoading = false;
  userLogin(BuildContext context) async {
    isLoading = true;
    setState(() {});
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('userlist')
          .where('user_name', isEqualTo: username)
          .get();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: snapshot.docs[0]['email'], password: password);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationBarr(),
        ),
      );
      isLoading = false;
      setState(() {});

      Fluttertoast.showToast(msg: 'Successfully logged in');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        isLoading = false;
        setState(() {});
        print("No User Found for that Email");

        Fluttertoast.showToast(msg: 'No User Found for that Email');
      } else if (e.code == 'wrong-password') {
        isLoading = false;
        setState(() {});
        print("Wrong Password Provided by User");

        Fluttertoast.showToast(msg: 'Wrong Password Provided by User');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 140,
                  width: 130,
                  //height: MediaQuery.of(context).size.height/4,
                  // decoration: BoxDecoration(
                  //     image:
                  //         DecorationImage(image: AssetImage("images/rio.png"))),
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Login to your Account to get started ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter username';
                    }
                    return null;
                  },
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please Enter Email';
                  //   } else if (!value.contains('@')) {
                  //     return 'Please Enter Valid Email';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                  obscureText: pass ? _isObscure : false,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      suffixIcon: pass
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: _isObscure
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    ),
                            )
                          : null),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(ForgotPassword());
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                isLoading
                    ? const Center(
                        child: SizedBox(
                            width: 80,
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballBeat,
                              colors: [
                                Color(0xff5FDED7),
                              ],
                              strokeWidth: 2,
                              pathBackgroundColor: Color(0xff5FDED7),
                            )),
                      )
                    : MaterialButton(
                        height: 45,
                        minWidth: double.infinity,
                        color: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              // email = emailController.text;
                              username = usernameController.text;
                              password = passwordController.text;

                              //  email = emailController.text;
                              //   password = passwordController.text;
                            });

                            userLogin(context);
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 17,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account? ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignupScreen());
                      },
                      child: Text(
                        ' Sign Up',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
