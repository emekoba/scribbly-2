import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scribbly/enums.dart';
import 'package:scribbly/widgets/post.dart';

class PrivateTab extends StatelessWidget {
  final List privateIdeas;
  const PrivateTab({Key? key, required this.privateIdeas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (privateIdeas.isEmpty) {
      return const Center(
          child: Text("Create your first idea by clicking the '+' button"));
    } else {
      return MasonryGridView.count(
        itemCount: privateIdeas.length,
        crossAxisCount: 2,
        itemBuilder: (context, index) {
          return Post(
            id: privateIdeas[index]["id"].toString(),
            name: privateIdeas[index]["name"],
            ideaType: IdeaTypes.private,
            tags: const ["wewa"],
            username: privateIdeas[index]["username"],
            description: privateIdeas[index]["description"],
          );
        },
      );
    }

    // return FutureBuilder<List<dynamic>>(
    //   future: libraryBloc.getMyIdeas(),
    //   builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
    //     if (snapshot.hasData) {
    //       List fetchedIdeas = snapshot.data as List;

    //       return MasonryGridView.count(
    //           itemCount: fetchedIdeas.length,
    //           crossAxisCount: 2,
    //           itemBuilder: (context, index) {
    //             return Post(
    //               id: "wsdddsdsssd",
    //               // id: idea["id"],
    //               name: fetchedIdeas[index]["name"],
    //               ideaType: IdeaTypes.private,
    //               username: fetchedIdeas[index]["username"],
    //             );
    //           });
    //     } else {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //   },
    // );
  }
}
