import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF030423),
        title: Text('GrievBoard'),
        titleSpacing: 50.0,
        actions: <Widget>[
          Center(
            child: Row(
              children: <Widget>[
                Button('About'),
                Button('Home'),
                Button('Login'),
              ],
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Text('Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", co'),
    )
    );
  }
}

class Button extends StatelessWidget {

  final String text;
  Button(this.text);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Color(0xFF030423),
      onPressed: () {  },
      child: Text('$text'),
      textColor: Colors.white,
    );
  }
}

