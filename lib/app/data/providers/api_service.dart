import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_shop/app/data/models/login_model.dart';
import 'package:plan_shop/app/data/models/post_model.dart';

import '../models/user_model.dart';

class ApiService {
  final dio = Dio();
  final box = GetStorage();
  final String baseUrl = "http://10.0.2.2:8000/api";

  //////////////////////  Auth  //////////////////////
  // Login
  Future<LoginResModel> login(
      {required String email, required String password}) async {
    try {
      var formData = FormData.fromMap({
        'email': email,
        'password': password,
      });
      final response = await dio.post("$baseUrl/login",
          data: formData,
          options: Options(
            headers: {
              'Accept': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ));
      if (response.statusCode == 200) {
        return LoginResModel.fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw Exception("Invalid credentials");
      }
      throw Exception("Failed to Login");
    } catch (e) {
      rethrow;
    }
  }

  // Logout
  Future<bool> logout() async {
    try {
      final response = await dio.post(
        "$baseUrl/logout",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
      throw Exception("Falied to Logout");
    } catch (e) {
      rethrow;
    }
  }

  // Register
  Future<bool> register({
    required String name,
    required String email,
    required String password,
    File? image,
  }) async {
    try {
      var formData = FormData.fromMap({
        'email': email,
        'name': name,
        'password': password,
        'image':
            image != null ? await MultipartFile.fromFile(image.path) : null,
      });
      final response = await dio.post(
        "$baseUrl/register",
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 400) {
        throw Exception('Email already exists');
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Delete
  Future<bool> delete() async {
    try {
      final response = await dio.delete(
        '$baseUrl/delete',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        return Future.delayed(const Duration(seconds: 2), () => true);
      } else if (response.statusCode == 404) {
        throw Exception("User not found");
      } else {
        throw Exception("Failded to delete user");
      }
    } catch (e) {
      rethrow;
    }
  }

  // get current user
  Future<UserResModel> getCurrentUser() async {
    try {
      final response = await dio.post(
        "$baseUrl/me",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserResModel.fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      }

      throw Exception("Failed to get user");
    } catch (e) {
      rethrow;
    }
  }
  /////////////////////////////////////////////////

  //////////////////////  Post  //////////////////////
  // Get Posts
  Future<PostModel> getPosts() async {
    try {
      final response = await dio.get(
        "$baseUrl/posts",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return PostModel.fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw Exception("Unautherized");
      }
      throw Exception("Failed to get Post");
    } catch (e) {
      rethrow;
    }
  }
}
