import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercamp/core/widgets/sign_in_button.dart';

class SignWithEmail extends StatefulWidget {
  @override
  _SignWithEmailState createState() => _SignWithEmailState();
}

class _SignWithEmailState extends State<SignWithEmail> {
  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();
  String _errorMessage = '';

  Future<void> signInWithEmail() async {
    try {
      var _credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
      print(_credential.user!.email);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      setState(() {
        if (e.code == 'user-not-found') _errorMessage = 'kullanıcı bulunamadı ';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_errorMessage,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Theme.of(context).errorColor)),
          Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextFormField(
                controller: _email,
                decoration: InputDecoration(
                    hintText: 'Email', prefixIcon: Icon(Icons.email)),
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                      hintText: 'Password', prefixIcon: Icon(Icons.lock)))),
          SignInButton(
            onPressed: signInWithEmail,
            text: 'SignIn',
            width: MediaQuery.of(context).size.width * .9,
          ),
          SignInButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Geri Git',
            width: MediaQuery.of(context).size.width * .9,
          )
        ],
      )),
    );
  }
}
