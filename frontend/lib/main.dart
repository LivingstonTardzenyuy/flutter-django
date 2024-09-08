import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          InkWell( child: Icon(Icons.shopping_cart, color: Colors.black)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(),
                onPressed: (){},
                child: Text(
                    'Sign Up',
                    style: TextStyle(

                    ),
                )),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              child: Container(
                height: size.height * 0.1,
                width: double.infinity,
                child: TextField(
                  onChanged: (value){

                  },
                  decoration: InputDecoration(
                    hintText: "Enter your Password.",
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent, width: 2.0
                      ),
                      borderRadius: BorderRadius.circular(16.0)
                    )
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

