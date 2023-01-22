import 'package:bus_ticketing/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class ProfilePage extends StatelessWidget {
  final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: TextRegular(text: 'Profile', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: userData,
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            dynamic data = snapshot.data;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/profile.png',
                    height: 125,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextBold(
                      text: data['name'], fontSize: 18, color: Colors.black),
                  TextRegular(
                      text: 'Full Name', fontSize: 12, color: Colors.grey),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBold(
                      text: data['bday'], fontSize: 18, color: Colors.black),
                  TextRegular(
                      text: 'Birthdate', fontSize: 12, color: Colors.grey),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBold(
                      text: data['address'], fontSize: 18, color: Colors.black),
                  TextRegular(
                      text: 'Address', fontSize: 12, color: Colors.grey),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBold(
                      text: data['email'], fontSize: 18, color: Colors.black),
                  TextRegular(text: 'Email', fontSize: 12, color: Colors.grey),
                ],
              ),
            );
          }),
    );
  }
}
