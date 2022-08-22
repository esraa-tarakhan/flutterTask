import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../global/global.dart';
import '../models/medicine.dart';


class APIHandler {
  static Future<NewsModel> getData() async {
    try {
      var uri = Uri.https(
          BASE_URL,
          "api/v1/medicine/1",

      );
      var response = await http.get(uri);
print("respons");
print(response);
      // print("response ${jsonDecode(response.body)}");
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        print("error");
        throw data["message"];
      }

      return NewsModel.fromJson(data);
    } catch (error) {
      log("An error occured $error");
      throw error.toString();
    }
  }




}
