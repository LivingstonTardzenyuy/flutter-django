import 'dart:convert';
import 'package:frontend/data_service/book_service.dart';
import 'package:frontend/views/constants.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

void main() async {
  Note bookService = Note();
  await bookService.printToken();
}


class Note {
  Future<void> printToken() async{
    var box = await Hive.openBox(tokenBox);
    var token = box.get('token');
    print("The token is $token");
  }
}