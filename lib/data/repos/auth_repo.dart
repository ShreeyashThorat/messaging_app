import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../core/api.dart';
import '../models/user_model.dart';

class AuthRepo {
  final Api api = Api();

  Future<UserModel> createAccount(
    String name,
    String email,
    String number,
    String password,
    String gender,
    String dob,
    String profilePic,
    String nationality,
    String state,
    String intro,
    String deviceToken,
  ) async {
    try {
      Response response = await api.sendRequest.post("/user/create-user",
          data: jsonEncode({
            'name': name,
            'email': email,
            'number': number,
            'password': password,
            'gender': gender,
            'dob': dob,
            'profilePic': profilePic,
            'nationality': nationality,
            'state': state,
            'intro': intro,
            'deviceToken': deviceToken
          }));
      if (response.statusCode == 200) {
        if (response.data['success'] == false) {
          throw Exception("${response.data['message']}");
        } else {
          UserModel user = UserModel.fromJson(response.data['data']);
          final userBox = await Hive.openBox('user_box');
          userBox.put('user_data', user.toJson());
          return user;
        }
      } else {
        throw Exception('Failed to create account');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(
    String number,
    String password,
    String deviceToken,
  ) async {
    try {
      Response response = await api.sendRequest.post("/user/login",
          data: jsonEncode({
            'number': number,
            'password': password,
            'deviceToken': deviceToken,
          }));
      if (response.statusCode == 200) {
        if (response.data['success'] == false) {
          throw Exception("${response.data['message']}");
        } else {
          UserModel user = UserModel.fromJson(response.data['data']);
          final userBox = await Hive.openBox('user_box');
          userBox.put('user_data', user.toJson());
          return user;
        }
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      rethrow;
    }
  }
}
