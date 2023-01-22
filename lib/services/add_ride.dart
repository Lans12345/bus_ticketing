import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

Future addRide(
    String from,
    String to,
    String totalPassenger,
    String name,
    String nameOfBus,
    String departTime,
    String arrivalTime,
    String availableSeats,
    String distance,
    String payment) async {
  final docUser = FirebaseFirestore.instance.collection('Rides').doc();

  String tdata = DateFormat("hh:mm a").format(DateTime.now());

  final json = {
    'from': from,
    'to': to,
    'totalPassenger': totalPassenger,
    'name': name,
    'nameOfBus': nameOfBus,
    'departTime': departTime,
    'arrivalTime': arrivalTime,
    'availableSeats': availableSeats,
    'distance': distance,
    'payment': payment,
    'id': docUser.id,
    'uid': FirebaseAuth.instance.currentUser!.uid,
    'time': tdata,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
