import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:students/database/functions/db_functions.dart';
import 'package:students/home.dart';
import 'database/model/data_model.dart';


class AddScreen extends StatelessWidget {
   final _nameController = TextEditingController();
   final _ageController = TextEditingController();
   final _guardianController = TextEditingController();
   final _contactController = TextEditingController();

  AddScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Controller _controllerForImage = Get.put(Controller());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white30,
          title: const Text(
            'Add Students',
            style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: _nameController,
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
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: _ageController,
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
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: _guardianController,
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
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: _contactController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 103, 103, 103),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: 'Contact number',
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<Controller>(builder: (controller) {
                        return Container(
                          margin: const EdgeInsets.only(left: 15, bottom: 15),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/avatar.png"),
                            ),
                          ),
                          child: img.trim().isNotEmpty
                              ? CircleAvatar(
                                  backgroundImage: MemoryImage(
                                      const Base64Decoder().convert(img)),
                                 
                                )
                              : Container(),
                        );
                      }),
                      IconButton(
                        onPressed: () async {
                          _controllerForImage.pickimage();
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  
                  SizedBox(
                    width: 310,
                    child: ElevatedButton(
                      onPressed: () {
                        onSubmitButtonClicked(context);
                      },
                      child: const Text('submit'),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),      
    );
  }

  Future<void> onSubmitButtonClicked(BuildContext context) async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _guardian = _guardianController.text.trim();
    final _contact = _contactController.text.trim();
    final _img = img.trim();
    if (_name.isEmpty ||
        _age.isEmpty ||
        _guardian.isEmpty ||
        _contact.isEmpty ||_img.isEmpty) {
      return;
    }
    Get.snackbar("Uploaded", "Student details uploaded",snackPosition: SnackPosition.BOTTOM,duration: const Duration(seconds: 2),backgroundColor: const Color.fromARGB(255, 96, 254, 252));   
    final _student = studentModel(
      name: _name,
      age: _age,
      guardian: _guardian,
      contact: _contact,
      image: img,
    );
    Get.offAll(()=> const HomeScreen());
    await addStudent(_student);
    _nameController.clear();
    _ageController.clear();
    _guardianController.clear();
    _contactController.clear();
  }
}
