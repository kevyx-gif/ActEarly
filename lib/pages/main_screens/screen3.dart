import 'package:actearly/utils/functions.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  final String documentId; // El ID del documento que deseas obtener
  Screen3({required this.documentId, super.key});
  @override
  _Screen3 createState() => _Screen3();
}

class _Screen3 extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 400,
            child: IconButton(
                onPressed: () => {logOut(context)},
                icon: Icon(Icons.exit_to_app)),
          )
        ],
      ),
    ));
  }
}


/* CODIGO screen1.dart
import 'package:actearly/services/firebase_service.dart';
import 'package:actearly/utils/class.dart';
import 'package:flutter/material.dart';

//final user = userActual();

//import 'package:crud_firebase/services/firebase_service.dart'
class Screen1 extends StatelessWidget {
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

*/ 