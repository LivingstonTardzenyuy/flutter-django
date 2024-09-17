import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() async {
  BookService bookService = BookService();
  await bookService.fetchBooks();
}




class AuthServices{
  final String baseUrl = 'http://127.0.0.1:8000';
  Future<RegistrationResponse?> registration(String username, String email, String password1, String password2) async{
    var response = await http.post(Uri.parse("$baseUrl/accounts/rest-auth/registration/"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({  // Encode the body as JSON
          "username": username,
          "email": email,
          "password1": password1,
          "password2": password2,
        }),
    );
    if (response.statusCode == 200){
      print(response.body);
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else{
      print('Error sending for auth: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }

  Future<String?> login(String username, password) async{
    try{
      var response = await http.post(Uri.parse("$baseUrl/accounts/auth/login/"),
          headers: {"Content-Type": 'Application/json'},
          body: jsonEncode({
            "username": username,
            "password": password,
          })
      );

      if (response.statusCode == 200){
        return response.body;
      }  else{
        print('Error sending for login: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch(e){
        print('Exception occured: $e');
        return null;
      }
    }

}





class RegistrationResponse{
  List<dynamic>? non_fields_errors;
  List<dynamic>? password1;
  List<dynamic>? username;
  List<dynamic>? email;
  dynamic? key;
  RegistrationResponse({this.non_fields_errors, this.password1, this.username, this.email, this.key});

  factory RegistrationResponse.fromJson(json){
    return RegistrationResponse(
      email: json["email"],
      key: json["key"],
      non_fields_errors: json["non_fields_errors"],
      password1: json["password1"],
      username: json["username"]
    );
  }
}