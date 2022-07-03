import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/database/functions/db_functions.dart';
import 'package:students/database/model/data_model.dart';
import 'package:students/splash.dart';
Future<void> main() async {   
  WidgetsFlutterBinding.ensureInitialized();   
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(studentModelAdapter().typeId)) {
    Hive.registerAdapter(studentModelAdapter());
  }
 await getAllStudents();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
