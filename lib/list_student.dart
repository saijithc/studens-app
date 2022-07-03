import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:students/profile.dart';
import 'database/functions/db_functions.dart';
import 'database/model/data_model.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    //  ValueListenableBuilder(
    //   valueListenable: studentListNotifier,
    //   builder: (BuildContext ctx, List<studentModel> studentList, Widget? child) {
    //     return 
        Scaffold(
          backgroundColor: Colors.black,
          body:ListView(
            children:[ Column(children:[SizedBox(
              height: MediaQuery.of(context).size.height*0.84,width: double.infinity,
            child: Obx(() =>  ListView.separated(
              itemBuilder: (ctx, index) {
                final data = studentList.value[index];
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
                    Get.to(()=>profile_screen(data: data));              
                  },leading:CircleAvatar(radius: 40,backgroundImage: MemoryImage(
                      const Base64Decoder().convert(data.image.toString())),) ,
                  trailing: IconButton(
                    onPressed: () async {
                      if (data.id != null) {
                        Get.defaultDialog(title: 'Delete !',
                        middleText: 'Do you want to delete   ${data.name.toUpperCase()} ?',
                        onCancel: (){}, onConfirm: (){ deleteStudent(data.id!);Get.back();                     
                        Get.snackbar('Deleted', ' ${data.name.toUpperCase()} deleted from this list',backgroundColor: const Color.fromARGB(255, 183, 180, 180),
                        snackPosition: SnackPosition.BOTTOM);});                      
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
              itemCount: studentList.value.length,
            ),),)]
            //  ListView.separated(
            //   itemBuilder: (ctx, index) {
            //     final data = studentList[index];
            //     return ListTile(
            //       // hoverColor: Colors.black,
            //       tileColor: const Color.fromARGB(255, 133, 162, 163),
            //       title: Text(
            //         data.name,
            //         style: const TextStyle(color: Colors.white),
            //       ),
            //       subtitle: Text(
            //         data.age,
            //         style: const TextStyle(color: Colors.white),
            //       ),
            //       onTap: () {
            //         Get.to(profile_screen(data: data));              
            //       },leading:CircleAvatar(radius: 40,backgroundImage: MemoryImage(
            //           const Base64Decoder().convert(data.image.toString())),) ,
            //       trailing: IconButton(
            //         onPressed: () async {
            //           if (data.id != null) {
            //             Get.defaultDialog(title: 'Delete !',
            //             middleText: 'Do you want to delete   ${data.name.toUpperCase()} ?',
            //             onCancel: (){}, onConfirm: (){ deleteStudent(data.id!);Get.back();                     
            //             Get.snackbar('Deleted', ' ${data.name.toUpperCase()} deleted from this list',backgroundColor: const Color.fromARGB(255, 183, 180, 180),
            //             snackPosition: SnackPosition.BOTTOM);});                      
            //           }
            //         },
            //         icon: const Icon(
            //           Icons.delete,
            //           color: Colors.black,
            //         ),
            //       ),
            //     );
            //   },
            //   separatorBuilder: (ctx, index) {
            //     return const Divider();
            //   },
            //   itemCount: studentList.length,
            // ),
            ),],
          )
        );
      }
    // );
  // }
}
