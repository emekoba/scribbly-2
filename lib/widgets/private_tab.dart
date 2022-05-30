import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribbly/bloc/library_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scribbly/enums.dart';
import 'package:scribbly/widgets/post.dart';

class PrivateTab extends StatelessWidget {
  const PrivateTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LibraryController libraryBloc = Get.put(LibraryController());

    return FutureBuilder<List<dynamic>>(
        future: libraryBloc.getPrivateIdeas(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            List fetchedIdeas = snapshot.data as List;

            return MasonryGridView.count(
                itemCount: fetchedIdeas.length,
                crossAxisCount: 2,
                itemBuilder: (context, index) {
                  return Post(
                    id: "wsdddsdsssd",
                    // id: idea["id"],
                    name: fetchedIdeas[index]["name"],
                    ideaType: IdeaTypes.private,
                    username: fetchedIdeas[index]["username"],
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
