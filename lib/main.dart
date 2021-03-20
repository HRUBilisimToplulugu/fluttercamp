import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercamp/core/widgets/custom_button.dart';
import 'package:fluttercamp/core/widgets/icon_sign_in_button.dart';
import 'package:fluttercamp/core/widgets/sign_in_button.dart';

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

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
              onPressed: () {},
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
              onPressed: () {},
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
              onPressed: () {},
              text: 'Anonim olarak devam et!',
              buttonColor: Color(0xFFcbee68),
              textColor: Colors.black54,
              width: MediaQuery.of(context).size.width * .9),
        ],
      ),
    ));
  }
}
