import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_app/models/user_model.dart';

class ApiService {
  String endPoint = 'https://reqres.in/api/users?page=1';

  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      print("getUser ok");
      return result.map(((e) => UserModel.fromMap(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
