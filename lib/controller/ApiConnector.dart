// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../ui.dart';

class ApiConnector extends GetConnect{

  Map<String, String> header = {
    'Content-Type': 'application/json',

    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
    'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept',
    'authorization': 'Basic ' + base64Encode(utf8.encode('${Ui.login}:${Ui.password}')),
  };

  Future<List<dynamic>> getall(String url, String id) async {
    Uri uri = Uri.parse("${Ui.url}${url}${id}");

    final response = await http.get(uri, headers: header);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception("Error");
    }
  }
}