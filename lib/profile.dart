import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:students/database/functions/db_functions.dart';
import 'package:students/database/model/data_model.dart';
import 'package:students/edit_screen.dart';

// ignore: camel_case_types
class profile_screen extends StatelessWidget {
  final studentModel data;
 
  const profile_screen({Key? key, required this.data}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    
    // var child;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: const Text(
          'profile',
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Container(
                  width: 330,
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: const Color.fromARGB(255, 173, 246, 248),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: CircleAvatar(
                              radius: 80,
                              child: img.trim().isEmpty
                                  ? CircleAvatar(
                                      radius: 80,
                                      backgroundImage: MemoryImage(
                                          const Base64Decoder()
                                              .convert(data.image.toString())),
                                    )
                                  : Container(
                                      color: const Color.fromARGB(
                                          255, 127, 115, 238),
                                    ))),
                      const SizedBox(height: 40),
                      Text('Name :  ${data.name}',
                          style: const TextStyle(fontSize: 20)),
                      Text('Age :  ${data.age}',
                          style: const TextStyle(fontSize: 20)),
                      Text('Guardian : ${data.guardian}',
                          style: const TextStyle(fontSize: 20)),
                      Text('Contact  : ${data.contact}',
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => edit_screen(
                                      data: data,
                                    )));
                          },
                          child: const Text('Edit Profile'))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
