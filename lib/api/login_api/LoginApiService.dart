

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11_pplg_02_01/database/DatabaseModel.dart';

import 'LoginModel.dart';
import 'RegisterModel.dart';

class ApiService {
  final String baseUrl = 'https://mediadwi.com/api';

  Future<LoginModel> loginAuth (String username, String password) async {
    final response = await http.post(
        Uri.parse('$baseUrl/latihan/login'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          "username" : username,
          "password" : password
        }
    );
    final data = json.decode(response.body);

    if (data['status'] == true){
      return LoginModel.fromJson(data);
    }
    else {
      return LoginModel(
          status: data['status'],
          message: data['message'],
          token: "Error"
      );
    }
  }

  Future<RegisterModel> registerUser (String username, String password, String fullname, String email) async {
    final response = await http.post(
        Uri.parse('$baseUrl/latihan/register-user'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          "username" : username,
          "password" : password,
          "full_name" : fullname,
          "email" : email
        }
    );
    final data = json.decode(response.body);
    return RegisterModel.fromJson(data);
  }

  // Future<Data> getUserData (String token) async{
  //   final response = await http.get(Uri.parse('$baseUrl/latihan/get-profile?token=$token'));
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //
  //     if(jsonData['status'] == true){
  //       final data = jsonData['data'];
  //       return Data.fromJson(data);
  //     }
  //     else {
  //       return Data(email: "Data Invalid", fullName: "Data Invalid", username: "Data Invalid");
  //     }
  //   }
  //   else {
  //     return Data(email: "Data error", fullName: "Data error", username: "Data error");
  //   }
  // }
}