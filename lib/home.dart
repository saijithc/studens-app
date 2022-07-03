import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students/database/functions/db_functions.dart';
import 'package:students/search_page.dart';
import 'add_student.dart';
import 'list_student.dart';
class HomeScreen extends StatelessWidget {
 const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white30,
          title: const Text(
            'Students Details',
            style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Get.to(()=> const ScreenSearch());
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
              Get.to(()=> AddScreen());
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
        ),      
    );
  }
}
