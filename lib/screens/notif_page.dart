import 'package:bus_ticketing/utils/colors.dart';
import 'package:bus_ticketing/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotifPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: TextRegular(
            text: 'Notifications', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Rides')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print('error');
              return const Center(child: Text('Error'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
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
                  return Card(
                    child: ListTile(
                      leading: TextBold(
                          text: data.docs[index]['nameOfBus'],
                          fontSize: 14,
                          color: Colors.black),
                      trailing: TextRegular(
                          text: data.docs[index]['time'],
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  );
                }));
          }),
    );
  }
}
