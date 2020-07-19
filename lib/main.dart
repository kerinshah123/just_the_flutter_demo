import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.green[800],
            accentColor: Colors.black,
            fontFamily: "Nunito"),
        home: Scaffold(
          body: Container(
            child: Loginpage(),
          ),
        ));
  }
}

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  int _pageState = 0;

  var _Background = Colors.white;
  var _Textcolor = Colors.green[800];
  double windowsHeigth = 0;
  double _loginYoffset = 0;
  double _registarYoffset = 0;
  double _LoginOpacity = 1;

  @override
  Widget build(BuildContext context) {
    windowsHeigth = MediaQuery.of(context).size.height;

    switch (_pageState) {
      case 0:
        _Background = Colors.white;
        _Textcolor = Colors.green[800];
        _loginYoffset = windowsHeigth;
        _registarYoffset = windowsHeigth;
        _LoginOpacity = 1;
        break;
      case 1:
        _Background = Colors.amber;
        _Textcolor = Colors.white;
        _loginYoffset = 400;
        _registarYoffset = windowsHeigth;
        _LoginOpacity = 1;

        break;
      case 2:
        _Background = Colors.amber;
        _Textcolor = Colors.white;
        _loginYoffset = 380;
        _registarYoffset = 400;
        _LoginOpacity = 0.7;
        break;
    }

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          color: _Background,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // first element App name
                Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Text(
                        "Car Rental",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.green[800],
                            fontFamily: "Pacifio"),
                      ),
                    ),
                  ),
                ),

                //second element App logo

                Container(
                  padding: EdgeInsets.only(bottom: 350),
                  child: Center(
                    child: Image.asset("assets/images/logo2.png"),
                  ),
                ),

                //third element button

                Container(
                    padding: EdgeInsets.all(30),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_pageState != 0) {
                            _pageState = 0;
                          } else {
                            _pageState = 1;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ))
              ]),
        ),
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _loginYoffset, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_LoginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40))),
          child: Column(
            children: <Widget>[
              edittextwithicon(
                icon: Icons.email,
                txthint: "Enter Your Email...",
              ),
              edittextwithicon(
                icon: Icons.security,
                txthint: "Enter Your Password...",
              ),
              roundButton(btntxt: "Login"),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 2;
                  });
                },
                child: borderButton(
                  bordertxt: "Create New Account",
                ),
              )
            ],
          ),
        ),
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _registarYoffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Column(
            children: <Widget>[
              edittextwithicon(
                icon: Icons.email,
                txthint: "Enter New Email...",
              ),
              edittextwithicon(
                icon: Icons.security,
                txthint: "Enter New Password...",
              ),
              roundButton(btntxt: "Sign Up"),
              GestureDetector(
                onTap: ()
                {
                  setState(() {
                    _pageState = 1;
                  });
                },
                child: borderButton(
                  bordertxt: "Back to Login",
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class borderButton extends StatefulWidget {
  final String bordertxt;

  borderButton({this.bordertxt});

  @override
  _borderButtonState createState() => _borderButtonState();
}

class _borderButtonState extends State<borderButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green[800], width: 2),
          borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(
          widget.bordertxt,
          style: TextStyle(color: Colors.green[800], fontSize: 16),
        ),
      ),
    );
  }
}

class edittextwithicon extends StatefulWidget {

  final IconData icon;
  final String txthint;

  edittextwithicon({this.icon,this.txthint});

  @override
  _edittextwithiconState createState() => _edittextwithiconState();
}

class _edittextwithiconState extends State<edittextwithicon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green[800], width: 2),
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Icon(
              widget.icon,
              size: 20,
              color: Colors.green[800],
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                border: InputBorder.none,
                hintText: widget.txthint
              ),
            ),
          )
        ],
      ),
    );
  }
}

class roundButton extends StatefulWidget {
  final String btntxt;

  roundButton({this.btntxt});

  @override
  _roundButtonState createState() => _roundButtonState();
}

class _roundButtonState extends State<roundButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top : 80 , left: 20,right: 20,bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.green[800], borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(
          widget.btntxt,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
