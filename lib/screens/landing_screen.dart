import 'package:bus_ticketing/screens/auth/login_page.dart';
import 'package:bus_ticketing/utils/colors.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/images/welcome.PNG',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                    onPressed: (() {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }),
                    child: Text(
                      'Next',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 24,
                          color: primary,
                          fontFamily: 'QBold'),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
