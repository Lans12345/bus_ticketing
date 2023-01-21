import 'package:bus_ticketing/screens/auth/login_page.dart';
import 'package:bus_ticketing/screens/home_screen.dart';
import 'package:bus_ticketing/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';

class HistoryScreen extends StatelessWidget {
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: (() {}),
                                icon: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: (() {}),
                                icon: const Icon(
                                  Icons.notification_add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: IconButton(
                            onPressed: (() {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text(
                                          'Logout Confirmation',
                                          style: TextStyle(
                                              fontFamily: 'QBold',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        content: const Text(
                                          'Are you sure you want to Logout?',
                                          style:
                                              TextStyle(fontFamily: 'QRegular'),
                                        ),
                                        actions: <Widget>[
                                          MaterialButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
                                            child: const Text(
                                              'Close',
                                              style: TextStyle(
                                                  fontFamily: 'QRegular',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPage()));
                                            },
                                            child: const Text(
                                              'Continue',
                                              style: TextStyle(
                                                  fontFamily: 'QRegular',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ));
                            }),
                            icon: const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: 'Ride History', fontSize: 32, color: Colors.white),
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
                    child: ListView.builder(itemBuilder: ((context, index) {
                      return ListTile(
                        title: TextRegular(
                            text: index.toString(),
                            fontSize: 14,
                            color: Colors.black),
                      );
                    }))),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                ButtonWidget(
                    onPressed: (() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    }),
                    text: 'Add Ride',
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
