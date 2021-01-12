import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:libres/main.dart';
//import 'package:libres/planner.dart';

class LoginTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  signIn(String email, password) async {
    String url = "http://192.168.1.11/restful/public/api/auth/login";
    Map body = {"email": email, "password": password};

    var res = await http.post(url, body: body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text(
                "LOGIN",
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            TextField(
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "Email",
              ),
            ),
            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key),
                hintText: "Password",
                suffixIcon: Icon(
                  Icons.visibility,
                ),
              ),
            ),
            //FlatButton(
            //  onPressed: () {
            //    Navigator.push(
            //      context,
            //      MaterialPageRoute(builder: (context) => planner()),
            //    );

            //    signIn(emailcontroller.text, passwordcontroller.text);
            //  },
            //  child: Text('LOGIN'),
            //),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterTab()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
