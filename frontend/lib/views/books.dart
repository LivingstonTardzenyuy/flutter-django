import 'package:flutter/material.dart';
import 'package:frontend/data_service/book_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../main.dart';
import 'books_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  BookService bookService = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFE6E6E6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.to(() => BooksList());
              },
              icon: Icon(Icons.menu, color: Colors.black)),
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

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  child: Container(
                    height: size.height * 0.1,
                    width: double.infinity,
                    child: TextField(
                      onChanged: (value){

                      },
                      decoration: InputDecoration(
                          hintText: "Search.",
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
                          ),
                          suffixIcon: InkWell(
                            onTap:  (){},
                            child: Icon(Icons.search),
                          )
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFFFF),
                    border: Border.all(
                        color: Colors.black38
                    )
                ),
                height: size.height * 0.07,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6.00),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black26
                          ),
                          borderRadius: BorderRadius.circular(8.00),
                        ),
                        child: Text("Productive Ramadan"),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6.00),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black26
                          ),
                          borderRadius: BorderRadius.circular(8.00),
                        ),
                        child: Text("Back to Allah"),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6.00),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black26
                          ),
                          borderRadius: BorderRadius.circular(8.00),
                        ),
                        child: Text("Productive Ramadan"),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6.00),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black26
                          ),
                          borderRadius: BorderRadius.circular(8.00),
                        ),
                        child: Text("Back to Allah"),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white70
                      ),
                      child: InkWell(
                        onTap: (){},
                        child: Center(child: Text(
                          'Subjects',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white70
                      ),
                      child: InkWell(
                        onTap: (){},
                        child: Center(child: Text(
                          'Subjects',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white70
                      ),
                      child: InkWell(
                        onTap: (){},
                        child: Center(child: Text(
                          'Subjects',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                      ),
                    ),
                  ),



                ],
              ),

              Container(
                margin: EdgeInsets.all(20),
                height: size.height,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Books for Sell",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),

                    Obx(() {
                      if (bookService.books.isEmpty){
                        return Center(child: CircularProgressIndicator(),);
                      } else {
                        return Wrap(
                          direction: Axis.horizontal,
                          children: bookService.books.map((book) {
                            return Container(
                              margin: const EdgeInsets.all(5.0),
                              height: MediaQuery.of(context).size.height * 0.30,
                              width: MediaQuery.of(context).size.width * 0.42,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue, width: 2.0),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(child: Text(
                                        book.name,
                                      textAlign: TextAlign.center ,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800
                                      ),
                                    )),

                                    const SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                            book.price.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.red,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                        Text(
                                            book.price_with_discount.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: ClipRect(
                                          child: Image.memory(
                                            book.image_memory,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ) ,
                                    // const SizedBox(height: 10,),
                                    Align(
                                      alignment: Alignment(0, 0.8),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(),
                                          onPressed: () {},
                                          child: Text(
                                            'Add to Cart',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14), 
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        );

                      }
                    }),

                  ],
                ),
              )

            ],
          ),
        )
    );
  }
}

