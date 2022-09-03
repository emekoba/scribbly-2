import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:scribbly/app_data.dart';
import 'package:http/http.dart' as http;

enum ResponseStatus { success, unauthorized, failed }

class LibraryController extends GetxController {
  http.Client client = http.Client();
  final Map<String, Uri> endpoints = {
    "fetchMy": Uri.parse("$scribblyBackend/idea/get-users-ideas"),
    "fetchPub": Uri.parse("$scribblyBackend/idea/create-idea"),
    "create": Uri.parse("$scribblyBackend/idea/create-idea"),
  };

  getHeaders() {
    String accessToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjYyMTk5MDExLCJleHAiOjE2NjIyMjQyMTF9.-1osCPoqGZAXnmxWms1DQ1dUvXjX869iGVIWSrQDs6k";

    return {
      'Authorization': 'Bearer $accessToken',
    };
  }

  dynamic sortResponse(dynamic response) {
    ResponseStatus status = ResponseStatus.failed;
    Map body = {};

    switch (response.statusCode) {
      case 401:
        status = ResponseStatus.unauthorized;
        break;

      case 200:
        status = ResponseStatus.success;
        body = json.decode(response.body);
        break;
    }

    return {
      "status": status,
      'body': body,
    };
  }

  Future<List<dynamic>> getMyIdeas() async {
    List myIdeas = [];

    var response = sortResponse(await client.get(
      endpoints["fetchMy"]!,
      headers: getHeaders(),
    ));

    if (response["status"] == ResponseStatus.success) {
      myIdeas = response["body"]["usersIdeas"];

      //* update local storage..

      //* return ideas
      return myIdeas;
    } else {
      //* fetch from backend fails, fetch from local storage

      return myIdeas;
    }
  }

  Future<Map<dynamic, dynamic>> getLayout() async {
    return {};
  }

  Future<dynamic> createIdea({
    required String name,
    required String description,
  }) async {
    try {
      var response = await http.post(
        endpoints["create"]!,
        body: json.encode({
          'name': name,
          'description': description,
        }),
      );

      inspect(response);
    } catch (e) {
      return {
        "success": false,
      };
    }
  }
}
