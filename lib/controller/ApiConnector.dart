import 'dart:convert';

import 'package:dvmastrsn/controller/Controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../ui.dart';

class ApiConnector extends GetConnect {
  final Controller _controller = Get.put(Controller());
  Map<String, String> header = {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
    'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept',
    'authorization':
        'Basic ' + base64Encode(utf8.encode('${Ui.login}:${Ui.password}')),
  };

  Future<List<dynamic>> getall(String url, String date) async {
    Uri uri = Uri();

    if (date != "") {
      uri = Uri.parse("${Ui.url}${url}${_controller.tabel.value}/${date}");
    } else {
      uri = Uri.parse("${Ui.url}${url}${_controller.tabel.value}");
    }

    final response = await http.get(uri, headers: header);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception("Error");
    }
  }
}
