import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_shop/app/data/models/login_model.dart';

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
      print('statuscode: ${response.statusCode}');
      if (response.statusCode == 200) {
        return true;
      }
      throw Exception("Falied to Logout");
    } catch (e) {
      rethrow;
    }
  }
}
