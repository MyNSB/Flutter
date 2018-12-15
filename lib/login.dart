import "dart:async";

import "package:flutter/widgets.dart";
import "package:flutter/material.dart";

import "session.dart";
import "timetable.dart";

class LoginState extends State<LoginController> {
  final _key = new GlobalKey<FormState>();
  var _usernameController = new TextEditingController();
  var _passwordController = new TextEditingController();

  Future<void> submit() async {
    if (!this._key.currentState.validate()) return;

    var response = await Session.auth(
      "http://35.244.66.186:8080/api/v1/user/Auth",
      this._usernameController.text,
      this._passwordController.text
    );

    if (response.statusCode == 200) {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (_) => new TimetableController()
        )
      );
    } else {
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login")
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new Form(
          key: this._key,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                controller: this._usernameController,
                decoration: new InputDecoration(
                  hintText: "Enter username",
                  labelText: "Username"
                )
              ),
              new TextFormField(
                controller: this._passwordController,
                obscureText: true,
                decoration: new InputDecoration(
                  hintText: "Enter password",
                  labelText: "Password"
                )
              ),
              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new Text("Login"),
                  onPressed: this.submit,
                  color: Colors.blue
                )
              )
            ]
          )
        )
      )
    );
  }
}

class LoginController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}