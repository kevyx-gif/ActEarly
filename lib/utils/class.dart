import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserActual {
  final String? nameUser;
  final String? email;
  final String? password;
  final String? provinceTerritory;
  final String? question;
  final String? userType;

  UserActual({
    this.nameUser,
    this.email,
    this.password,
    this.provinceTerritory,
    this.question,
    this.userType,
  });

  factory UserActual.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserActual(
      nameUser: data?['nameUser'],
      email: data?['email'],
      password: data?['password'],
      provinceTerritory: data?['provinceTerritory'],
      question: data?['question'],
      userType: data?['userType'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nameUser != null) "nameUser": nameUser,
      if (email != null) "email": email,
      if (password != null) "password": password,
      if (provinceTerritory != null) "provinceTerritory": provinceTerritory,
      if (question != null) "question": question,
      if (userType != null) "userType": userType,
    };
  }
}

//----------------ITEMS CLASS----------------//
class ListItem {
  final Widget Function(BuildContext) widgetBuilder;

  ListItem({required this.widgetBuilder});
}
