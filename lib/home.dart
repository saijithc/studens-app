// import 'db/function/db_functions.dart';
// import 'model/data_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:students/database/functions/db_functions.dart';
import 'package:students/search_page.dart';

import 'add_student.dart';

import 'list_student.dart';

// ignore: camel_case_types
class home_screen extends StatelessWidget {
  home_screen({Key? key}) : super(key: key);
  final Controller _controllerForImage = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    // getAllStudents();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: const Text(
          'Students Details',
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => ScreenSearch()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: const [Expanded(child: ListStudent())],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            img = '';
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const add_Screen()));
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
      ),
    );
  }
}
