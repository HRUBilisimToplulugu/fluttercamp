import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercamp/core/widgets/icon_sign_in_button.dart';
import 'package:fluttercamp/core/widgets/sign_in_button.dart';
import 'package:fluttercamp/view/sign_with_email/sign_with_email.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigInPage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  final Function(User?) callBack;

  SigInPage({Key? key, required this.callBack}) : super(key: key);

  signInAnonymous() async {
    UserCredential _user = await auth.signInAnonymously();
    print('Value: ' + _user.user!.displayName.toString());
    callBack(_user.user);
  }

  Future<void> signWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    var _user = await FirebaseAuth.instance.signInWithCredential(credential);
    callBack(_user.user);
    print(_user.user?.displayName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Giriş',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          IconSignButton(
              imagePath: 'assets/images/google-logo.png',
              onPressed: () => signWithGoogle(),
              text: 'Google ile giriş yap!',
              buttonColor: Color(0xFFFFFFFF),
              textColor: Colors.black54,
              width: MediaQuery.of(context).size.width * .9),
          SizedBox(
            height: 8,
          ),
          IconSignButton(
              imagePath: 'assets/images/facebook-logo.png',
              onPressed: () {},
              text: 'Facebook ile giriş yap!',
              buttonColor: Color(0xFF313389),
              textColor: Colors.white,
              width: MediaQuery.of(context).size.width * .9),
          SizedBox(
            height: 8,
          ),
          SignInButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignWithEmail()));
              },
              text: 'Email ile giriş yap!',
              buttonColor: Color(0xFF157463),
              textColor: Colors.white,
              width: MediaQuery.of(context).size.width * .9),
          SizedBox(
            height: 8,
          ),
          Text('ya da'),
          SizedBox(
            height: 8,
          ),
          SignInButton(
              onPressed: signInAnonymous,
              text: 'Anonim olarak devam et!',
              buttonColor: Color(0xFFcbee68),
              textColor: Colors.black54,
              width: MediaQuery.of(context).size.width * .9),
        ],
      ),
    ));
  }
}
