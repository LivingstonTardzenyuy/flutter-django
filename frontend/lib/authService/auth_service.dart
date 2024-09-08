import 'dart:convert';
import 'dart:developer';

import 'package:frontend/authService/auth_models.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController{
  var userList = <UserModel>[].obs;
  var isLoading = true.obs;

  var baseUrl = "http://127.0.0.1:8000";
  Future<UserModel?> registration(String? username, String? email, String? password1, String? password2) async{
    try{
      var response = await http.post(
          Uri.parse("$baseUrl/accounts/rest-auth/registration/"),
              headers: {"Content-Type": "Application/json"},
              body: jsonEncode({
                'username': username,
                'email': email,
                'password1': password1,
                'password2': password2,
              })
      );
      if (response.statusCode == 201){
        var data = jsonEncode(response.body) as Map<String, dynamic>;
        return UserModel.fromJson(data);
      } else {
        log("Failed to register: ${response.body}: ${response.statusCode}");
        return null;
      }
    } catch(e){
      log("Error getting data: $e");
      return null;
    } finally{
      isLoading.value = false;
    }
  }

}