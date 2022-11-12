import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:once/AuthFlutterFire/signin_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var email = "";
  var password = "";
  var Confirmpassword = "";
  var creator = "creator";
  var selectedUser = "user";
  var user = "user";
  bool isChecked = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ConfirmpasswordController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    emailController.dispose();
    passwordController.dispose();

    ConfirmpasswordController.dispose();
    super.dispose();
  }

  CollectionReference users =
      FirebaseFirestore.instance.collection('userlistflutterfire');
  registration(userr) async {
    isLoading = true;
    setState(() {});
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      users
          .add({
            'user_Id': userCredential.user!.uid,
            'email': email,
            'password': password,
            'selectedUser': userr
          })
          .then((value) => print("User Added"))
          .catchError(
              (error) => print('Failed to add user data in firestore: $error'));

      print(
        userCredential,
      );

      print("UserName${email}");
      Fluttertoast.showToast(msg: 'Registered succssfully');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
      );
      isLoading = false;
      setState(() {});
    } on FirebaseAuthException catch (e) {
      if (password != Confirmpassword) {
        isLoading = false;
        setState(() {});
        print("Password Provided is not correct");
        Fluttertoast.showToast(msg: 'Password Provided is not correct');
        if (e.code == 'weak-password') {
          isLoading = false;
          setState(() {});
          print("Password Provided is too Weak");
          Fluttertoast.showToast(msg: 'Password Provided is too Weak');
        }
      } else if (e.code == 'email-already-in-use') {
        isLoading = false;
        setState(() {});
        print("Account Already exists");
        Fluttertoast.showToast(msg: 'Account Already exists');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset('images/loginlogog.png'),
                  Row(
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Welcome to FlutterFire UI! Please create an account to continue',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(SignInScreen());
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 16),
                        ))
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            } else if (!value.contains('@')) {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: ConfirmpasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Confirm Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Confirm password',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                            if (isChecked == true) {
                              selectedUser = creator;
                              print("creator=$selectedUser");
                            } else {
                              selectedUser = user;
                              print("user=$selectedUser");
                            }
                          });
                        },
                      ),
                      Text('Become a Creator',
                          style: TextStyle(
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: isLoading
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
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        Confirmpassword =
                                            ConfirmpasswordController.text;
                                        email = emailController.text;
                                        password = passwordController.text;
                                      });
                                      registration(selectedUser);
                                    }
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
