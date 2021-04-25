import 'package:flutter/material.dart';
import 'package:BOOKAPP1522/Screens/Login/login_screen.dart';
import 'package:BOOKAPP1522/Screens/Signup/signup_screen.dart';
import 'package:BOOKAPP1522/Screens/Welcome/components/background.dart';
import 'package:BOOKAPP1522/components/rounded_button.dart';
import 'package:BOOKAPP1522/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0),
            RoundedButton(
              text: "LOGIN",
              color: Colors.red.shade700,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
