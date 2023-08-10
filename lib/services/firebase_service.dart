import 'package:cloud_firestore/cloud_firestore.dart';



FirebaseFirestore db = FirebaseFirestore.instance;

//list all users
Future<List> getUsers() async {
  List users = [];
  CollectionReference collectionReferenceUsers = db.collection('users');
  QuerySnapshot queryUsers = await collectionReferenceUsers
      .get(); //get all the records from the database

  queryUsers.docs.forEach((record) {
    users.add(record.data());
  });

  return users;
}

void getUser() async {
  FirebaseFirestore.instance.collection('users').doc('email5').get();

  final snapshot =
      await FirebaseFirestore.instance.collection('users').doc('UID').get();
  print(snapshot.data);
}

