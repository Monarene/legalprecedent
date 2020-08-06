import "package:flutter/material.dart";
import 'package:legal_precedents/Provider/startup_provider.dart';
import 'package:legal_precedents/pages/dashbaord.dart';
import 'package:legal_precedents/services/auth_service.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _showPassword = true;
  AuthService _authService = AuthService();

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController passwordController;
  TextEditingController nameController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    passwordController = new TextEditingController();
    nameController = new TextEditingController();
    super.initState();
  }

  submit(String email, String password, String name) async {
    var startupProvider = Provider.of<StartUpProvider>(context, listen: false);
    var uid = await _authService.createUser(email, password, name);
    if (uid != null) {
      startupProvider.setOnAuthenticated(true);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Dashbaord()), (_) => false);
      emailInputController.clear();
      passwordController.clear();
      nameController.clear();
    } else {
      print("An error occurred");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Text(
                'Create Your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                style: TextStyle(fontSize: 22),
                controller: nameController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Color(0xFF707070),
                    ),
                    hintText: "Name",
                    contentPadding: EdgeInsets.only(left: 20, top: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailInputController,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Color(0xFF707070),
                    ),
                    hintText: "Email Address",
                    contentPadding: EdgeInsets.only(left: 20, top: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                style: TextStyle(fontSize: 22),
                obscureText: this._showPassword,
                controller: passwordController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_open,
                      color: Color(0xFF707070),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(this._showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            this._showPassword = !this._showPassword;
                          });
                        }),
                    hintText: "Password",
                    contentPadding: EdgeInsets.only(left: 20, top: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Sign Up ",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  onPressed: () async {
                    await submit(emailInputController.text.trim(),
                        passwordController.text, nameController.text);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
