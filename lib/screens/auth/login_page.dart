import 'package:bus_ticketing/screens/auth/history_page.dart';
import 'package:bus_ticketing/screens/auth/signup_page.dart';
import 'package:bus_ticketing/screens/home_screen.dart';
import 'package:bus_ticketing/utils/colors.dart';
import 'package:bus_ticketing/widgets/button_widget.dart';
import 'package:bus_ticketing/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var obs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back.jpg'))),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextBold(
                    text: 'Please login to continue',
                    fontSize: 15,
                    color: Colors.black),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      color: buttonColor),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextRegular(
                            text: 'Email', fontSize: 12, color: Colors.black),
                        SizedBox(
                            height: 30,
                            child: TextFormField(
                              onChanged: ((value) {}),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        TextRegular(
                            text: 'Password',
                            fontSize: 12,
                            color: Colors.black),
                        SizedBox(
                            height: 40,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: (() {
                                        setState(() {
                                          obs = !obs;
                                        });
                                      }),
                                      icon: obs
                                          ? Icon(Icons.visibility)
                                          : Icon(Icons.visibility_off))),
                              obscureText: obs,
                              onChanged: ((value) {}),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: SizedBox(
                            width: 200,
                            height: 40,
                            child: ButtonWidget(
                                onPressed: (() {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HistoryScreen()));
                                }),
                                text: 'Login',
                                color: primary),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextRegular(
                        text: "Doesn't have an Account?",
                        fontSize: 12,
                        color: Colors.black),
                    TextButton(
                      onPressed: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupPage()));
                      }),
                      child: TextBold(
                          text: "Signup", fontSize: 14, color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
