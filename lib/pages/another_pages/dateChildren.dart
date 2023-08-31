/*
import "package:flutter/material.dart";

class DateChildren extends StatefulWidget {
  const DateChildren({ super.key });

  @override
  State<DateChildren> createState() => _DateChildrenState();
}

class _DateChildrenState extends State<DateChildren> {

  final titleDate = TextEditingController();
  final date = TextEditingController();
  final timeDate = TextEditingController();
  final descriptionDate = TextEditingController();

  final titleDateKey = GlobalKey<FormState>();
  final dateKey = GlobalKey<FormState>();
  final timeDateKey = GlobalKey<FormState>();
  final descriptionDateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Date Children'),
      ),  
      body: const Center(
        child: Text('Page Date Children'),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

import '../../utils/functions.dart';

class DateChildrenA extends StatelessWidget {
  const DateChildrenA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Date Children')),
        body: const DateChildren(),
      ),
    );
  }
}

class DateChildren extends StatefulWidget {
  const DateChildren({super.key});

  @override
  State<DateChildren> createState() => _DateChildrenState();
}

class _DateChildrenState extends State<DateChildren> {

  final GlobalKey<FormState> titleDateKey= GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: titleDateKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'Title:',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          
          TextFormField(
            controller: _dateController,
            decoration: const InputDecoration(
              hintText: 'Date',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          TextFormField(
            controller: _timeController,
            decoration: const InputDecoration(
              hintText: 'Time',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (titleDateKey.currentState!.validate()) {
                  updateChildDatabase();
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

/* dentro de class_DateChildrenState
  final GlobalKey<FormState> titleDateKey= GlobalKey<FormState>();
  final GlobalKey<FormState> dateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> timeDateKey= GlobalKey<FormState>();
  final GlobalKey<FormState> descriptionDateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: titleDateKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Title:',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Date',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Time',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (titleDateKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
*/

/*
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario Flutter',
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo de Formulario'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor ingresa tu correo electrónico';
                  }
                  // Puedes agregar validaciones más específicas de correo electrónico aquí
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // Aquí podrías realizar acciones con los datos ingresados, como enviarlos a un servidor
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Datos ingresados'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nombre: $_name'),
                              Text('Correo Electrónico: $_email'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/