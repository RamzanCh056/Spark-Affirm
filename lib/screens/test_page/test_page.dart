import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:once/screens/test_page/chat_screen.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  CollectionReference users = FirebaseFirestore.instance.collection('testData');
  CollectionReference usersPhoto =
      FirebaseFirestore.instance.collection('testDataPhoto');
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('testData').snapshots();
  var textdata = '';
  var tempImage;
  var downloadUrl;

  final textController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Spacer(),
                  Text(
                    'Test Page',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  MaterialButton(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    onPressed: () async {
                      Get.to(ChatScreen());
                    },
                    child: Text(
                      'Chat',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Text here',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                onPressed: () async {
                  textdata = textController.text;
                  await users
                      .add({
                        'Text': textdata,
                      })
                      .then((value) => print("Text Added"))
                      .catchError((error) =>
                          print('Failed to add Text in firestore: $error'));
                  textController.clear();
                },
                child: Text(
                  'Add Text',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('testData')
                        // .where("selectedUser", isNotEqualTo: 'admin')
                        .snapshots(),
                    // _usersStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ListTile(
                            onTap: () {},
                            title: Text(data['Text'].toString()),
                            trailing: MaterialButton(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              onPressed: () async {
                                var Id = document.id;
                                users.doc(Id).delete();
                              },
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                      minWidth: MediaQuery.of(context).size.width / 4,
                      height: 45,
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Text("Profile Image",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      onPressed: () {
                        pickImage();
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey, width: 3)),
                    // child: tempImage!? Center(child: Text('pick')):
                    // provider.tempImage==null?Image.network("src"):
                    child: tempImage == null
                        ? Container(
                            child: Center(child: Text('pick')),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.file(
                              tempImage,
                              fit: BoxFit.fill,
                            )),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 250,
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('testDataPhoto')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ListTile(
                            onTap: () {},
                            title: Image.network(data['Photo'].toString()),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  pickImage() async {
    try {
      var photo = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (photo != null) {
        tempImage = File(photo.path);
        print("IMage is selected");
        uploadFile();
      } else {
        print("No image selected");
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future uploadFile() async {
    if (tempImage != null) {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child("ProfilePictures")
          .child("pictures")
          .putFile(tempImage!);
      TaskSnapshot taskSnapshot = await uploadTask;
      downloadUrl = await taskSnapshot.ref.getDownloadURL();
      await usersPhoto
          .add({
            'Photo': downloadUrl,
          })
          .then((value) => print("photo Added"))
          .catchError(
              (error) => print('Failed to add Text in firestore: $error'));
    } else {
      return;
    }
  }
}
