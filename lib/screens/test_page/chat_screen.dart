//import 'package:chat_app_flutter/views/firebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Service service = Service();
  final storeMessage = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController msg = TextEditingController();

  // for current user
  getCurrentUser() {
    final user = auth.currentUser;
    //if user not empty it assign to login user
    if (user != null) {
      loginUser = user;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        actions: [
          // IconButton(
          //     onPressed: () async {
          //      // service.sugnOut(context);
          //       //now here we remove that email from the key when user click logout button
          //       SharedPreferences pref = await SharedPreferences.getInstance();
          //       pref.remove("email");
          //       // it will remove user email when user click logout button
          //     },
          //     icon: Icon(Icons.logout)),
        ],
        title: Text(loginUser!.email.toString()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text('Messages'),
          Expanded(child: ShowMessages()),
          Row(
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.blue, width: 0.2))),
                child: TextField(
                  controller: msg,
                  decoration: InputDecoration(hintText: 'Enter Message...'),
                ),
              )),
              IconButton(
                  onPressed: () {
                    if (msg.text.isNotEmpty) {
                      storeMessage.collection("Messages").doc().set({
                        "messages": msg.text.trim(),
                        "user": loginUser!.email.toString(),
                        "time": DateTime.now()
                      });
                      msg.clear();
                    }
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.teal,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class ShowMessages extends StatefulWidget {
  const ShowMessages({Key? key}) : super(key: key);

  @override
  _ShowMessagesState createState() => _ShowMessagesState();
}

class _ShowMessagesState extends State<ShowMessages> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Messages")
            .orderBy("time")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            physics: ScrollPhysics(),
            primary: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Column(
                  crossAxisAlignment: loginUser!.email == data['user']
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: loginUser!.email == data['user']
                              ? Colors.blue.withOpacity(0.4)
                              : Colors.amber.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(18)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          Text(data['messages']),
                        ],
                        // title:
                        // subtitle: Text(data['user']),
                      ),
                    )
                    // Text(data['user']),
                  ],
                ),
              );
            }).toList(),
          );
          // return ListView.builder(
          //   itemCount: snapshot.data.doc.lenth,
          //   itemBuilder: (context, i) {
          //   QueryDocumentSnapshot x = snapshot.data!.[i];
          //   return ListTile(

          //     title: Text(x['messages']),
          //   );
          // });
        });
  }
}
