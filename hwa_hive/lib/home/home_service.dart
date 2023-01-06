// https://jsonplaceholder.typicode.com/users

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hwa_hive/home/user_model.dart';

abstract class IHomeService {
  late final Dio _dio;

  IHomeService(Dio dio) {
    _dio = dio;
  }

  Future<List<UserModel>?> fetchUsers();
}

class HomeService extends IHomeService {
  HomeService(super.dio);

  @override
  Future<List<UserModel>?> fetchUsers() async {
    final response = await _dio.get('/users');

    if (response.statusCode == HttpStatus.ok) {
      final res = response.data;
      if (res is List) {
        return res.map((e) => UserModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
