import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(
  String name,
  String bday,
  String address,
  String email,
) async {
  final docUser = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final json = {
    'name': name,
    'email': email,
    'bday': bday,
    'address': address,
    'id': docUser.id
  };

  await docUser.set(json);
}
