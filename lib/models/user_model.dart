// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String uid;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.uid,
  });

  factory UserModel.fromFirestore(DocumentSnapshot map) {
    return UserModel(
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      firstName: map['firstName'],
      uid: map['uid'],
      lastName: map['lastName'],
    );
  }
}
