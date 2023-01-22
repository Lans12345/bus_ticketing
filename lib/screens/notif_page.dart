import 'package:bus_ticketing/utils/colors.dart';
import 'package:bus_ticketing/widgets/text_widget.dart';
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
      body: ListView.builder(itemBuilder: ((context, index) {
        return Card(
          child: ListTile(
            leading:
                TextBold(text: 'Bus Name', fontSize: 14, color: Colors.black),
            trailing:
                TextRegular(text: '9:45pm', fontSize: 12, color: Colors.grey),
          ),
        );
      })),
    );
  }
}
