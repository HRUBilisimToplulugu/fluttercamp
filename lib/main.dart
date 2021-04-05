import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercamp/core/widgets/custom_button.dart';
import 'package:fluttercamp/core/widgets/icon_sign_in_button.dart';
import 'package:fluttercamp/core/widgets/sign_in_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttercamp/view/home_page/home_page.dart';
import 'package:fluttercamp/view/sign_in_page/sign_in_page.dart';
import 'package:fluttercamp/view/sign_with_email/sign_with_email.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MainWidget());
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Camp',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? _user;
  _isSignIn(User? user) {
    setState(() {
      _user = user;
      print(_user?.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SigInPage(callBack: (_user) => _isSignIn(_user));
    } else {
      return HomePageWidget(callback: (_user) => _isSignIn(_user));
    }
  }
}
