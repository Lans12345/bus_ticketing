import 'package:bus_ticketing/screens/auth/login_page.dart';
import 'package:bus_ticketing/screens/home_screen.dart';
import 'package:bus_ticketing/screens/notif_page.dart';
import 'package:bus_ticketing/screens/profile_page.dart';
import 'package:bus_ticketing/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                                onPressed: (() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                                }),
                                icon: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: (() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => NotifPage()));
                                }),
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
                                            onPressed: () async {
                                              await FirebaseAuth.instance
                                                  .signOut();
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
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Rides')
                            .where('uid',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser!.uid)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print('error');
                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            print('waiting');
                            return const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black,
                              )),
                            );
                          }

                          final data = snapshot.requireData;
                          return ListView.builder(
                              itemCount: data.docs.length,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Card(
                                    child: ListTile(
                                      onTap: (() {
                                        showDialog(
                                            context: context,
                                            builder: ((context) {
                                              return AlertDialog(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon((Icons
                                                            .bus_alert_rounded)),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        TextBold(
                                                            text: data
                                                                    .docs[index]
                                                                ['nameOfBus'],
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black),
                                                      ],
                                                    ),
                                                    TextBold(
                                                        text: data.docs[index]
                                                            ['time'],
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                content: SizedBox(
                                                  height: 250,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Divider(),
                                                      SizedBox(
                                                        height: 50,
                                                        child: ListTile(
                                                          leading: const Icon(
                                                            Icons
                                                                .location_on_rounded,
                                                            color: Colors.red,
                                                          ),
                                                          title: TextRegular(
                                                              text:
                                                                  'Origin: ${data.docs[index]['from']}',
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                          trailing: TextBold(
                                                              text: data.docs[
                                                                      index][
                                                                  'departTime'],
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child: ListTile(
                                                          leading: const Icon(
                                                            Icons.my_location,
                                                            color: Colors.red,
                                                          ),
                                                          title: TextRegular(
                                                              text:
                                                                  'Destination: ${data.docs[index]['to']}',
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                          trailing: TextBold(
                                                              text: data.docs[
                                                                      index][
                                                                  'arrivalTime'],
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      const Divider(),
                                                      SizedBox(
                                                        height: 50,
                                                        child: ListTile(
                                                          leading: TextBold(
                                                              text:
                                                                  'Distance: ',
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                          trailing: TextBold(
                                                              text: data.docs[
                                                                          index]
                                                                      [
                                                                      'distance'] +
                                                                  'km',
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: SizedBox(
                                                          height: 50,
                                                          child: ListTile(
                                                            leading: TextBold(
                                                                text:
                                                                    'Payment: ',
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black),
                                                            trailing: TextBold(
                                                                text: data.docs[
                                                                            index]
                                                                        [
                                                                        'payment'] +
                                                                    'php',
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: (() {
                                                        Navigator.pop(context);
                                                      }),
                                                      child: TextBold(
                                                          text: 'Close',
                                                          fontSize: 14,
                                                          color: Colors.grey))
                                                ],
                                              );
                                            }));
                                      }),
                                      leading: const Icon(Icons.bus_alert),
                                      title: TextBold(
                                          text: data.docs[index]['from'],
                                          fontSize: 14,
                                          color: Colors.black),
                                      subtitle: TextRegular(
                                          text: 'Origin',
                                          fontSize: 12,
                                          color: Colors.grey),
                                      trailing: TextRegular(
                                          text: data.docs[index]['nameOfBus'],
                                          fontSize: 12,
                                          color: Colors.black),
                                    ),
                                  ),
                                );
                              }));
                        })),
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
