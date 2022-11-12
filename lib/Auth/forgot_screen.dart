import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:once/Auth/login_screen.dart';
import 'package:once/Auth/signup_screen.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  var email1 = "";
  final emailController = TextEditingController();
  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email1);
      Get.to(LogInScreen());
      Fluttertoast.showToast(msg: 'Password Reset Email has been sent !');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Fluttertoast.showToast(msg: 'No user found for that email.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(12),
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
                'Forgot Password',
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
                    'Enter Email to Reset Password ',
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
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Email';
                  } else if (!value.contains('@')) {
                    return 'Please Enter Valid Email';
                  }
                  return null;
                },
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
              Expanded(child: Container()),
              MaterialButton(
                height: 45,
                minWidth: double.infinity,
                color: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      email1 = emailController.text;
                    });
                    resetPassword();
                  }
                },
                child: Text(
                  'Update Password',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 17,
                    decorationThickness: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
