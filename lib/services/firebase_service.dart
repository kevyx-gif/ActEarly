import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUser() async {
  List users = [];
  CollectionReference collectionReferenceUsers = db.collection('users');
  QuerySnapshot queryUsers = await collectionReferenceUsers.get();  //get all the records from the database

  queryUsers.docs.forEach((record) { 
    users.add(record.data());
  });

  return users;
}