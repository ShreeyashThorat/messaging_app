import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:messaging_app/data/models/user_model.dart';

import '../../core/api.dart';

class GetUsersRepo {
  final Api api = Api();

  Future<List<UserModel>> getAllUsers(String userId) async {
    try {
      Response response = await api.sendRequest.post("/user/getUser/all",
          data: jsonEncode({
            'currentUserId': userId,
          }));

      if (response.statusCode == 200) {
        if (response.data['success'] == false) {
          throw 'Try again....';
        } else {
          return (response.data['data'] as List<dynamic>)
              .map((json) => UserModel.fromJson(json))
              .toList();
        }
      } else {
        throw 'Try again....';
      }
    } catch (e) {
      rethrow;
    }
  }
}
