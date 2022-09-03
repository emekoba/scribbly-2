import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribbly/bloc/app_bloc.dart';
import 'package:scribbly/bloc/library_bloc.dart';

class IdeaPage extends StatelessWidget {
  final String id;
  const IdeaPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appBloc = Get.put(AppController());
    final LibraryController libraryBloc = Get.put(LibraryController());

    return FutureBuilder<Map<dynamic, dynamic>>(
        future: libraryBloc.getLayout(),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          // if (false) {
          // if (snapshot.hasData) {
          // List ideas = snapshot.data as List;
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              mini: true,
              backgroundColor: appBloc.activePageTheme,
              child: const Icon(
                Icons.arrow_drop_up,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: false,
                  pinned: true,
                  expandedHeight: 300,
                  // elevation: 0,
                  title: Text(
                    "ideaname",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 15),
                  ),
                  flexibleSpace: const FlexibleSpaceBar(
                      // title: Container(
                      //     child: Text(ideaname,
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .headline6
                      //             .copyWith(fontSize: 15)))

                      // background: FittedBox(
                      //   fit: BoxFit.cover,
                      //   child: Image.asset(
                      //     "lib/Resources/Media/Photos/Background/background7.jpg",
                      //   ),
                      // ),
                      ),
                  actions: [
                    InkWell(
                      splashColor: appBloc.activePageTheme,
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 15, 0),
                        child: Icon(
                          Icons.search_rounded,
                        ),
                      ),
                    )
                  ],
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    height: 50,
                    color: Colors.white,
                  ),
                ),

                // Structure(pageTheme: idea["pageTheme"], structure: idea["structure"])
              ],
            ),
          );
        });
  }
}

class Cover extends StatelessWidget {
  final String ideaname;
  final Color pageTheme;

  // ignore: use_key_in_widget_constructors
  const Cover({required this.ideaname, required this.pageTheme});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        ideaname,
        style: Theme.of(context).textTheme.headline6?.copyWith(
              fontSize: 30,
              color: pageTheme,
            ),
      ),
    );
  }
}
