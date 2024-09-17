import 'package:flutter/material.dart';
import 'package:frontend/views/books.dart';
import 'package:frontend/views/books_list.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'helper/init_controller.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}


