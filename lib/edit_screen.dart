import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:students/database/functions/db_functions.dart';
import 'package:students/database/model/data_model.dart';
import 'package:students/home.dart';


// ignore: camel_case_types
class edit_screen extends StatelessWidget {
  final studentModel data;

  edit_screen({Key? key, required this.data}) : super(key: key);
  // final String name;
  // final String age;
  // final String guardian;
  // final String contact;
  // int? id;
  // edit_screen({
  //   Key? key,
  //   required this.name,
  //   required this.age,
  //   required this.guardian,
  //   required this.contact,
  //   this.id,
  // }) : super(key: key);
  // var imagecontroller = img;
  final nameUpdateController = TextEditingController();
  final ageUpdateController = TextEditingController();
  final guardianUpdateController = TextEditingController();
  final contactUpdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // imagecontroller ;
    nameUpdateController.text = data.name;
    ageUpdateController.text = data.age;
    guardianUpdateController.text = data.guardian;
    contactUpdateController.text = data.contact;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: const Text(
          'Edit',
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: MemoryImage(
                        const Base64Decoder().convert(data.image.toString())),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: nameUpdateController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 103, 103, 103),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: 'Name',
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: ageUpdateController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 103, 103, 103),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: 'Age',
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: guardianUpdateController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 103, 103, 103),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: 'Guardian name',
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: contactUpdateController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 103, 103, 103),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: 'Contact',
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        studentupdate(context);
                      },
                      child: const Text('update'))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Future<void> studentupdate(BuildContext context) async {
    // final img = imagecontroller;
    final name = nameUpdateController.text;
    final age = ageUpdateController.text;
    final guardian = guardianUpdateController.text;
    final contact = contactUpdateController.text;

    if (name.isEmpty || age.isEmpty || guardian.isEmpty || contact.isEmpty) {
      return;
    }
    final studentvalue = studentModel(
      // image: img,
      name: name,
      age: age,
      guardian: guardian,
      contact: contact,
      id: data.id,
      image: data.image,
    );
    await updatestudent(data.id, studentvalue);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => home_screen()));
  }
}
