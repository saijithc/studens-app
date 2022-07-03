import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:students/database/model/data_model.dart';
import 'package:students/edit_screen.dart';
class ProfileScreen extends StatelessWidget {  
  final studentModel data;
  const ProfileScreen({Key? key, required this.data}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
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
                  width:  MediaQuery.of(context).size.height*0.4,
                  height: MediaQuery.of(context).size.height*0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: const Color.fromARGB(255, 173, 246, 248),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.4,decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                          image:  MemoryImage( const Base64Decoder().convert(data.image.toString())),fit: BoxFit.fill)),),
                      )
                      , SizedBox(height: MediaQuery.of(context).size.height*0.03),
                      ListTile(leading:const Text('Name :' , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),maxLines: 2,),
                      title: Text(data.name.toUpperCase(),style: const TextStyle(fontSize: 15)),),
                       ListTile(leading:const Text('Age :' , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),maxLines: 2,),
                       title: Text(data.age.toUpperCase(),style: const TextStyle(fontSize: 15)),),
                        ListTile(leading:const Text('Guardian :' , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),maxLines: 2,),
                        title: Text(data.guardian.toUpperCase(),style: const TextStyle(fontSize: 15)),),
                         ListTile(leading:const Text('Contact :' , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),maxLines: 2,),
                         title: Text(data.contact.toUpperCase(),style: const TextStyle(fontSize: 15)),),                        
                       SizedBox(height: MediaQuery.of(context).size.height*0.02 ),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(()=> EditScreen(data: data));                         
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
