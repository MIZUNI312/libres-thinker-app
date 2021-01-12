import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:libres/login.dart';

void main() {
  runApp(RegisterTab());
}

class RegisterTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'THINKER',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Register'),
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
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _notif = false;

  dataCreateUser(String name, String email, String password) async {
    String myUrl = "http://192.168.1.11/restful/public/api/auth/register";
    final response = await http.post(myUrl,
        headers: {'Accept': 'application/json'},
        body: {"name": "$name", "email": "$email", "password": "$password"});
    print("Response status: ${response.statusCode}");
    print("Response status: ${response.body}");
    if (response.statusCode == 200) {
      setState(() {
        _notif = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Created"),
              content: Text("User Created"),
              actions: <Widget>[
                RaisedButton(
                  color: Colors.transparent,
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

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
                "Register",
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Name",
              ),
            ),
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "Email",
              ),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key),
                hintText: "Password",
                suffixIcon: Icon(
                  Icons.visibility,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginTab()),
                );
                dataCreateUser(name.text, email.text, password.text);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
