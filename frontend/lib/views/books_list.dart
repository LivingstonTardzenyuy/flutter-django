import 'package:flutter/material.dart';
import 'package:frontend/data_service/book_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    final BookService bookService = Get.find();
    return Scaffold(
      appBar: AppBar(title:Text('Book Screen')),

      body: Obx(() {
        if (bookService.isLoading.value){
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: bookService.books.length,
              itemBuilder: (context, index){
                final book = bookService.books[index];
                return ListTile(
                  title: Text(book.author, style: TextStyle(color: Colors.black, fontSize: 18),),
                  trailing: Text(book.name),
                );
              });
        }
      }),
    );
  }
}
