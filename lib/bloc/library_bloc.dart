import 'package:get/get.dart';
import 'package:scribbly/backend.dart';

class LibraryController extends GetxController {
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
}
