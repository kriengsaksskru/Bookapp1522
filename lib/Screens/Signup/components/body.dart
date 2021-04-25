import 'package:flutter/material.dart';
import 'package:BOOKAPP1522/Screens/Login/login_screen.dart';
import 'package:BOOKAPP1522/Screens/Signup/components/background.dart';
import 'package:BOOKAPP1522/Screens/Signup/components/or_divider.dart';
import 'package:BOOKAPP1522/Screens/Signup/components/social_icon.dart';
import 'package:BOOKAPP1522/components/already_have_an_account_acheck.dart';
import 'package:BOOKAPP1522/components/rounded_button.dart';
import 'package:BOOKAPP1522/components/rounded_input_field.dart';
import 'package:BOOKAPP1522/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/book1.svg",
              height: size.height * 0.45,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "ลงทะเบียน",
              color: Colors.purple.shade700,
              press: () {},
            ),
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
          ],
        ),
      ),
    );
  }
}
