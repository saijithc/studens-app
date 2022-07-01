import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:students/profile.dart';

import 'database/functions/db_functions.dart';
import 'database/model/data_model.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          // ignore: non_constant_identifier_names
          (BuildContext ctx, List<studentModel> StudentList, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.black87,
          body: ListView.separated(
            itemBuilder: (ctx, index) {
              final data = StudentList[index];
              return ListTile(
                // hoverColor: Colors.black,
                tileColor: const Color.fromARGB(255, 133, 162, 163),
                title: Text(
                  data.name,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  data.age,
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => profile_screen(
                            data: data,
                          )));
                },leading:CircleAvatar(radius: 40,backgroundImage: MemoryImage(
                    const Base64Decoder().convert(data.image.toString())),) ,
                trailing: IconButton(
                  onPressed: () async {
                    if (data.id != null) {
                      await deleteStudent(data.id!);
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: StudentList.length,
          ),
        );
      },
    );
  }
}
