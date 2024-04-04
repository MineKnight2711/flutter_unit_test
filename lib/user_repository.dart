import 'dart:convert';

import 'package:http/http.dart' as http;

import 'user_model.dart';

class UserRepository {
  final http.Client client;
  UserRepository(this.client);

  Future<User> getUser() async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1"));
    if (response.statusCode == 200) {
      // prettyPrintJson(User.fromJson(jsonDecode(response.body)).toJson());
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception("Có lỗi xảy ra");
  }
}
