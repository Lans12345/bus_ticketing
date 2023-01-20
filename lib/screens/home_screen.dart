import 'package:bus_ticketing/screens/auth/history_page.dart';
import 'package:bus_ticketing/utils/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
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
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: (() {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HistoryScreen()));
                            }),
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 40, right: 40),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(100)),
                  //     child: SizedBox(
                  //       height: 45,
                  //       child: TextFormField(
                  //         decoration: InputDecoration(
                  //             enabledBorder: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(100),
                  //             ),
                  //             focusedBorder: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(100),
                  //             ),
                  //             prefixIcon: Icon(Icons.search),
                  //             hintText: 'Search bus for your journey',
                  //             hintStyle: TextStyle(fontFamily: 'QRegular'),
                  //             filled: true,
                  //             fillColor: Colors.white,
                  //             border: InputBorder.none),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 350,
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
                                text: 'From: ',
                                fontSize: 12,
                                color: Colors.black),
                            SizedBox(
                                height: 30,
                                child: TextFormField(
                                  onChanged: ((value) {}),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextRegular(
                                text: 'To:', fontSize: 12, color: Colors.black),
                            SizedBox(
                                height: 30,
                                child: TextFormField(
                                  onChanged: ((value) {}),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextRegular(
                                text: 'Date:',
                                fontSize: 12,
                                color: Colors.black),
                            SizedBox(
                                height: 30,
                                child: TextFormField(
                                  onChanged: ((value) {}),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextRegular(
                                text: 'Total Passenger:',
                                fontSize: 12,
                                color: Colors.black),
                            SizedBox(
                                height: 30,
                                child: TextFormField(
                                  onChanged: ((value) {}),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextRegular(
                                text: 'Passenger Name:',
                                fontSize: 12,
                                color: Colors.black),
                            SizedBox(
                                height: 30,
                                child: TextFormField(
                                  onChanged: ((value) {}),
                                )),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
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
