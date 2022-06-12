import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:scribbly/app_data.dart';
import 'package:scribbly/backend.dart';
import 'package:http/http.dart' as http;

class LibraryController extends GetxController {
  final Map<String, Uri> endpoints = {
    "create": Uri(path: "$scribblyBackend/ideas/create"),
  };

  Future<List<dynamic>> getPrivateIdeas() async {
    //* get data from backend.
    List privateIdeas =
        allIdeas.where((idea) => idea["status"] == "private").toList();

    if (privateIdeas.isEmpty) {
      //* fetch from backend fails, fetch from local storage

      return privateIdeas;
    } else {
      //* update local storage..

      //* return ideas
      return privateIdeas;
    }
  }

  getUserIdeas() {
    // zv5gYvAig9Z9ovAY28m9
  }

  Future<dynamic> createIdea({
    required String name,
    required String description,
  }) async {
    try {
      var response = await http.post(
        endpoints["create"]!,
        body: json.encode({
          'name': 'getLeaderboardData',
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
