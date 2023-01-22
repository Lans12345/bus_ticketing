import 'package:bus_ticketing/screens/auth/login_page.dart';
import 'package:bus_ticketing/services/add_user..dart';
import 'package:bus_ticketing/utils/colors.dart';
import 'package:bus_ticketing/widgets/button_widget.dart';
import 'package:bus_ticketing/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var obs = true;

  var obs1 = true;

  late String name = '';
  late String birthday = '';
  late String address = '';
  late String email = '';
  late String password = '';
  late String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back.jpg'))),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  TextBold(text: 'Fill Up', fontSize: 15, color: Colors.black),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 450,
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
                              text: 'Name', fontSize: 12, color: Colors.black),
                          SizedBox(
                              height: 30,
                              child: TextFormField(
                                onChanged: ((value) {
                                  name = value;
                                }),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextRegular(
                              text: 'Birthday',
                              fontSize: 12,
                              color: Colors.black),
                          SizedBox(
                              height: 30,
                              child: TextFormField(
                                onChanged: ((value) {
                                  birthday = value;
                                }),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextRegular(
                              text: 'Address',
                              fontSize: 12,
                              color: Colors.black),
                          SizedBox(
                              height: 30,
                              child: TextFormField(
                                onChanged: ((value) {
                                  address = value;
                                }),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextRegular(
                              text: 'Email', fontSize: 12, color: Colors.black),
                          SizedBox(
                              height: 30,
                              child: TextFormField(
                                onChanged: ((value) {
                                  email = value;
                                }),
                              )),
                          const SizedBox(
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
                                            ? const Icon(Icons.visibility)
                                            : const Icon(
                                                Icons.visibility_off))),
                                obscureText: obs,
                                onChanged: ((value) {
                                  password = value;
                                }),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextRegular(
                              text: 'Confirm Password',
                              fontSize: 12,
                              color: Colors.black),
                          SizedBox(
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: (() {
                                          setState(() {
                                            obs1 = !obs1;
                                          });
                                        }),
                                        icon: obs1
                                            ? const Icon(Icons.visibility)
                                            : const Icon(
                                                Icons.visibility_off))),
                                obscureText: obs1,
                                onChanged: ((value) {
                                  confirmPassword = value;
                                }),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              width: 200,
                              height: 40,
                              child: ButtonWidget(
                                  onPressed: (() async {
                                    if (password != confirmPassword) {
                                      Fluttertoast.showToast(
                                          msg: 'Password do not match!');
                                    } else {
                                      try {
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                                email: email,
                                                password: password);

                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                child: SizedBox(
                                                    height: 300,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .check_circle_outline_outlined,
                                                          size: 75,
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        TextBold(
                                                            text:
                                                                'Registered Succesfully!',
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black),
                                                        const SizedBox(
                                                          height: 50,
                                                        ),
                                                        ButtonWidget(
                                                          onPressed: () {
                                                            addUser(
                                                                name,
                                                                birthday,
                                                                address,
                                                                email);

                                                            Navigator.of(
                                                                    context)
                                                                .pushReplacement(
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                LoginPage()));
                                                          },
                                                          text: 'Continue',
                                                          color: Colors.black,
                                                        ),
                                                      ],
                                                    )),
                                              );
                                            });
                                      } catch (e) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: TextRegular(
                                                      text: "$e",
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(true),
                                                      child: TextBold(
                                                          text: 'Close',
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ));
                                      }
                                    }
                                    // Navigator.of(context).pushReplacement(
                                    //     MaterialPageRoute(
                                    //         builder: (context) => LoginPage()));
                                  }),
                                  text: 'Signup',
                                  color: primary),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextRegular(
                          text: "Already have an Account?",
                          fontSize: 12,
                          color: Colors.black),
                      TextButton(
                        onPressed: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        }),
                        child: TextBold(
                            text: "Login", fontSize: 14, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
