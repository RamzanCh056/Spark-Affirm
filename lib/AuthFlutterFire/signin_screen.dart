import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:once/AuthFlutterFire/register.dart';
import 'package:once/AuthFlutterFire/resetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:once/Navbar/navbarr.dart';
import 'package:shared_preferences/shared_preferences.dart';

var googleuser;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var email = "";
  var password = "";
  bool isLoading = false;
  bool isGoogleLoading = false;

  userLogin(BuildContext context) async {
    isLoading = true;
    setState(() {});
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationBarr(),
        ),
      );
      await preferences.setBool('isLoggedIn', true);
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
                        'Sign in',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(RegisterScreen());
                        },
                        child: Text(
                          'Register',
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.to(ResetPassword());
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(fontSize: 16),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 25,
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
                                        email = emailController.text;

                                        password = passwordController.text;
                                      });

                                      userLogin(context);
                                    }
                                  },
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  isGoogleLoading
                      ? Center(
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
                      : Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  signInWithGoogle();
                                },
                                icon: FaIcon(FontAwesomeIcons.google),
                                label: Text("Login using Google"),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  primary: Colors.red,
                                  textStyle: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signInWithGoogle() async {
    isGoogleLoading = true;
    setState(() {});
    SharedPreferences preferences = await SharedPreferences.getInstance();
      SharedPreferences preferencesgoogle = await SharedPreferences.getInstance();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    googleuser = googleUser!.email.toString();
    await preferences.setString('email', googleuser.toString());
    
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    if (googleUser == null) {
      isGoogleLoading = false;
      setState(() {});
      print('error');
    } else {
      FirebaseFirestore.instance.collection("userlistflutterfire").add({
        'UID': googleUser.id,
        'email': googleUser.email,
        'user_name': googleUser.displayName
      });
      await preferences.setBool('isLoggedIn', true);
      isGoogleLoading = false;
      setState(() {});
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => NavigationBarr()),
          (route) => false);
      Fluttertoast.showToast(msg: 'Login Successfully');
      // Get.to(GoogleProfile(user: googleUser));
    }
  }
}
