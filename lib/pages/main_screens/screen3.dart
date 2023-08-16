import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  final String documentId; // El ID del documento que deseas obtener
  Screen3({required this.documentId, super.key});
  @override
  // ignore: library_private_types_in_public_api
  _Screen3 createState() => _Screen3();
}

class _Screen3 extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información del Documento'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.documentId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error al obtener el documento');
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Text(widget.documentId);
          }

          // El documento existe y se obtuvo con éxito
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          // Accede a los campos del documento utilizando la variable 'data'
          String nombre = data['nameUser'];
          String correo = data['email'];

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nombre: $nombre'),
                Text('Correo: $correo'),
                // Agrega más widgets para mostrar otros campos del documento
              ],
            ),
          );
        },
      ),
    );
  }
}
