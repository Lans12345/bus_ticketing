import 'package:bus_ticketing/utils/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: TextRegular(text: 'Profile', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
      body: Center(
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
            TextBold(text: 'Name', fontSize: 18, color: Colors.black),
            TextRegular(text: 'Full Name', fontSize: 12, color: Colors.grey),
            const SizedBox(
              height: 20,
            ),
            TextBold(text: 'Name', fontSize: 18, color: Colors.black),
            TextRegular(text: 'Full Name', fontSize: 12, color: Colors.grey),
            const SizedBox(
              height: 20,
            ),
            TextBold(text: 'Birthdate', fontSize: 18, color: Colors.black),
            TextRegular(text: 'Birthdate', fontSize: 12, color: Colors.grey),
            const SizedBox(
              height: 20,
            ),
            TextBold(text: 'Address', fontSize: 18, color: Colors.black),
            TextRegular(text: 'Address', fontSize: 12, color: Colors.grey),
            const SizedBox(
              height: 20,
            ),
            TextBold(text: 'Email', fontSize: 18, color: Colors.black),
            TextRegular(text: 'Email', fontSize: 12, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
