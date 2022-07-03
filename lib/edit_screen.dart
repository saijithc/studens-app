import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students/database/functions/db_functions.dart';
import 'package:students/database/model/data_model.dart';
import 'package:students/home.dart';
class EditScreen extends StatelessWidget {
  final studentModel data;

  EditScreen({Key? key, required this.data}) : super(key: key);
  final nameUpdateController = TextEditingController();
  final ageUpdateController = TextEditingController();
  final guardianUpdateController = TextEditingController();
  final contactUpdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                          fillColor: Colors.white,
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
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: 'Age',
                          hintStyle: TextStyle(color: Colors.white),
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
                          fillColor: Colors.white,
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
                          fillColor: Colors.white,
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
    Get.offAll(()=> const HomeScreen());
  }
}
