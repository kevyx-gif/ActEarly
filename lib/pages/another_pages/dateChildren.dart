import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DateChildren extends StatefulWidget {
  String email;
  DocumentSnapshot<Map<String, dynamic>>? userData;

  DateChildren(this.email, this.userData, {super.key});

  @override
  State<DateChildren> createState() => _DateChildrenState();
}

class _DateChildrenState extends State<DateChildren> {
  final GlobalKey<FormState> titleDateKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _descriptionController = TextEditingController();
  List<dynamic>? childrenData = [];

  @override
  void disposed() {
    super.dispose;
  }

  @override
  void initState() {
    childrenData = widget.userData!.data()?['children'] ?? [];
    super.initState();
  }

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
                print(childrenData);
                //if (titleDateKey.currentState!.validate()) {
                //updateChildDatabase(context, );
                // Process data.
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
