import 'dart:convert';

import 'package:http/http.dart' as http;

main() async{
  // var response = await http.get(Uri.parse('http://127.0.0.1:8001/core/'));
  // var response = await http.post(Uri.parse('http://127.0.0.1:8001/core/'),
  //                                   headers: <String, String>{
  //                                     'Content-Type': 'application/x-www-form-urlencoded',
  //                                   },
  //                                   body: <String, String>{
  //                                     "username":"Kongnyuy",
  //                                     "email":"kong@gmail.com",
  //                                     "password":"TypeScript01@",
  //                                   });
  //
  // print(jsonDecode(response.body));
  AuthServices authServices = AuthServices();
  // RegistrationResponse? responseBody = await authServices.registration("Livings2ton", "emai2l@gmail.com", "password01@", "password01@");
  var  responseLogin = await authServices.login("Livings2ton", "password01@");
  print(responseLogin);
  // if (responseBody != null){
  //   if (responseBody.email != null){
  //     responseBody.email!.forEach((e) => print(e));
  // }
  //
  // if (responseBody.username != null){
  // responseBody.username!.forEach((e) => print(e));
  // }
  //
  //
  // if (responseBody.non_fields_errors != null){
  // responseBody.non_fields_errors!.forEach((e) => print(e));
  // }
  //
  //
  // if (responseBody.password1 != null){
  // responseBody.password1!.forEach((e) => print(e));
  // }
  //
  //
  // if (responseBody.key != null){
  //   print(responseBody.key);
  // }
  // }

   var response = await http.get(Uri.parse("http://127.0.0.1:8000/accounts/auth/user/"),
                                      headers: {
                                        "Authorization": "Token 7f1c120ab77a3a0820979b248907c66dbce07ece"
                                        },
                                      );
   print(response.body);
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
      print('Error: ${response.statusCode}');
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
        print('Error: ${response.statusCode}');
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