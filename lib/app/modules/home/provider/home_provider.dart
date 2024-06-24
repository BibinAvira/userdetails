import 'dart:convert';

import 'package:get/get_connect/connect.dart';

class homeprovider extends GetConnect {
  Future<Map<String, dynamic>> GetData() async {
    try {
      httpClient.timeout = Duration(seconds: 60);
      var responce = await get('https://jsonplaceholder.typicode.com/users',
          headers: {"Content-Type": "application/json"});
      if (responce.status.hasError) {
        return {
          "code": responce.statusCode,
          "message":
              '${responce.statusCode} :${responce.statusText} \n ${responce.body}'
        };
      } else {
        return {
          "code": responce.statusCode,
          "message": jsonEncode(responce.body)
        };
      }
    } catch (e) {
      return {"code": 404, "message": e.toString()};
    }
  }
}
