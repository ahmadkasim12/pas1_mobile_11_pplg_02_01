// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  bool status;
  String message;
  Data data;

  ProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String username;
  String fullName;
  String email;

  Data({
    required this.username,
    required this.fullName,
    required this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    username: json["username"],
    fullName: json["full_name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "full_name": fullName,
    "email": email,
  };
}
