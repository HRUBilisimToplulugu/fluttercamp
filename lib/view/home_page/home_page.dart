import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key, required this.callback}) : super(key: key);
  final Function(User?) callback;

  _signOut() async {
    var instance = FirebaseAuth.instance;
    instance.signOut();
    if (await GoogleSignIn.standard().isSignedIn()) {
      GoogleSignIn.standard().signOut();
    }
    callback(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          ElevatedButton(onPressed: () => _signOut(), child: Text('Çıkış Yap'))
        ],
      ),
    );
  }
}
