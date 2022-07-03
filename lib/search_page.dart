import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:students/database/functions/db_functions.dart';
import 'package:students/database/model/data_model.dart';
import 'package:students/profile.dart';

// ignore: non_constant_identifier_names
ValueNotifier<List<studentModel>> Temp = ValueNotifier([]);

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);
  // final searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white30,
          title: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 244, 245),
                borderRadius: BorderRadius.circular(30)),
            child: TextField(
              onTap: () {
                Temp.value.addAll(studentList.value);
                // Temp.notifyListeners();
    
              },
              onChanged: (String? value) {
                if (value == null || value.isEmpty) {
                  Temp.value.addAll(studentList.value);
                } else {
                  Temp.value.clear();
                  for (studentModel i in studentList.value) {
                    if (i.name.toLowerCase().contains(value.toLowerCase())) {
                      Temp.value.add(i);
                    }
                  }
                }
                Temp.notifyListeners();
              },
              // controller: searchcontroller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
                hintText: 'Search',
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: ValueListenableBuilder(
                valueListenable: Temp,
                builder: (BuildContext ctx, List<studentModel> searchdata,
                    Widget? child) {
                  return ListView.separated(
                    itemBuilder: (ctx, index) {
                      final data = searchdata[index];
                      return ListTile(
                        title: Text(data.name),
                        onTap: () {
                          Get.to(profile_screen(data: data));
                        },
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider();
                    },
                    itemCount: searchdata.length,
                  );
                })),
      
    );
  }
}
