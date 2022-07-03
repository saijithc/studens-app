import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students/database/functions/db_functions.dart';
import 'package:students/database/model/data_model.dart';
import 'package:students/profile.dart';
Rx<RxList<studentModel>> temp = RxList<studentModel>([]).obs;
class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);
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
                temp.value.addAll(studentList.value);
              },
              onChanged: (String? value) {
                if (value == null || value.isEmpty) {
                  temp.value.addAll(studentList.value);
                } else {
                  temp.value.clear();
                  for (studentModel i in studentList.value) {
                    if (i.name.toLowerCase().contains(value.toLowerCase())) {
                      temp.value.add(i);
                    }
                  }
                }
              },
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
            child: ListView(children: [Column(children: [SizedBox(  height: MediaQuery.of(context).size.height*0.84,width: double.infinity,
            child: Obx((() =>    ListView.separated(
                    itemBuilder: (ctx, index) {
                      return ListTile(title: Text(temp.value[index].name),
                        onTap: () { Get.to(()=>ProfileScreen(data: temp.value[index])); },
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider();
                    },itemCount: temp.value.length,)),))],)],),
        )      
    );
  }
}
