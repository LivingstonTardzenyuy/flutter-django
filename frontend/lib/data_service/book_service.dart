

import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class BookService extends GetxController{
  RxList<Book> books = <Book>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }
  final String endpoint = 'http://192.168.1.109:8000';
  Future<void> fetchBooks() async {
    isLoading.value = true;
    try {
      var response = await http.get(Uri.parse("$endpoint/book/"));
      if (response.statusCode == 200){
        var data = jsonDecode(response.body) as List;
        books.value = data.map((book) => Book.fromJson(book)).toList();
      } else{
        print('Error getting books: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching books: $e");
    } finally{
      isLoading.value = false;
    }
  }
}

class Book{
  final int id;
  final String author;
  final String publisher;
  final String subject;
  final String name;
  final int price;
  final int discount;
  final String image;
  final String preview;
  final double price_with_discount;

  final Uint8List image_memory;
  Book({required this.id,required this.author,
    required this.publisher,required this.subject,
    required this.name,required this.price,
    required this.discount,required this.image,
    required this.preview, required this.image_memory,
    required this.price_with_discount,
  });

  Map<String, dynamic>toJson(){
    return{
      'id': id,
      'author': author,
      'publisher': publisher,
      'subject': subject, 'name': name, 'price': price,
      'discount': discount, 'image': image, 'preview': preview,
      'image_memory': image_memory, "price_with_discount": price_with_discount,
    };
  }

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
        id: json['id'], author: json['author'],
        publisher: json['publisher'], subject: json['subject'],
        name: json['name'], price: json['price'], discount: json['discount'],
        image: json['image'], preview: json['preview'],
        image_memory: base64Decode(json["image_memory"]),
        price_with_discount: json["price_with_discount"],
    );
  }
}