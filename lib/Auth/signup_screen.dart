import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:once/Auth/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var email = "";
  var password = "";
  var currentUser = FirebaseAuth.instance.currentUser;
  var username = "";
  var phone = "";
  var creator = "creator";
  var selectedUser = "user";
  var user = "user";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final usernamecontroller = TextEditingController();
  bool isChecked = false;
  bool _isObscure = true;
  bool pass = true;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();

    usernamecontroller.dispose();
    super.dispose();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('userlist');
  registration(username, userr) async {
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
            'user_name': username,
            'email': email,
            'password': password,
            // 'phone': phone,
            'selectedUser': userr
          })
          .then((value) => print("User Added"))
          .catchError(
              (error) => print('Failed to add user data in firestore: $error'));

      print(
        userCredential,
      );
      // try {

      // } catch (e) {
      //   print("Error Saving Data at firestore $e");
      // }
      print("UserName${username}");
      Fluttertoast.showToast(msg: 'Registered succssfully');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LogInScreen(),
        ),
      );
      isLoading = false;
      setState(() {});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        isLoading = false;
        setState(() {});
        print("Password Provided is too Weak");
        Fluttertoast.showToast(msg: 'Password Provided is too Weak');
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
                  'Welcome',
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
                      'Create Your Account to get started',
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
                  controller: usernamecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Fullname';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
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
                    labelText: 'Email',
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
                // SizedBox(
                //   height: 10,
                // ),
                // TextFormField(
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please Enter phone no';
                //     }
                //     return null;
                //   },
                //   controller: phoneController,
                //   decoration: InputDecoration(
                //     labelText: 'Phone',
                //     labelStyle: TextStyle(
                //       color: Colors.grey,
                //     ),
                //     focusedBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ),
                // ),
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
                  height: 10,
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
                  height: 100,
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              username = usernamecontroller.text;
                              phone = phoneController.text;
                              email = emailController.text;
                              password = passwordController.text;
                            });
                            registration(username, selectedUser);
                          }
                        },
                        child: Text(
                          'Sign up',
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
                      'Already a member? ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(LogInScreen());
                      },
                      child: Text(
                        'Login',
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
