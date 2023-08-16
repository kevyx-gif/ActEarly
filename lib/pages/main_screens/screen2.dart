import 'package:actearly/services/firebase_service.dart';
import 'package:actearly/utils/class.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  child: Text('Contenido de la pantalla 1'),
      body: FutureBuilder(
          future: getUsers(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data
                    ?.length, //data? show full or empty list, number of iterations
                itemBuilder: (context, index) {
                  //bucle show
                  try {
                    return Text(snapshot.data?[index]['email']);
                  } catch (e) {
                    print('error ');
                  }
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}

/*
import 'package:actearly/services/firebase_service.dart';
import 'package:flutter/material.dart';

//import 'package:crud_firebase/services/firebase_service.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  child: Text('Contenido de la pantalla 1'),
      body: FutureBuilder(
          future: getUser(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data
                    ?.length, //data? show full or empty list, number of iterations
                itemBuilder: (context, index) {
                  //bucle show
                  return Text(snapshot.data?[index]['email']);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}



*/