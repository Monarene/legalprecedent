import "package:flutter/material.dart";

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _showPassword = true;
  @override
  submit() {
    print("I have submitted");
  }

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
                  onPressed: submit,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
