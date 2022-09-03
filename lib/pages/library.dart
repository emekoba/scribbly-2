import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:scribbly/bloc/app_bloc.dart';
import 'package:scribbly/bloc/library_bloc.dart';
import 'package:scribbly/widgets/modals/create_idea_modal.dart';
import 'package:scribbly/widgets/private_tab.dart';
import 'package:scribbly/widgets/russ_tab_bar.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    final AppController appBloc = Get.put(AppController());
    final LibraryController libraryBloc = Get.put(LibraryController());

    final PageController topTabControl = PageController();

    void _openCreateIdeaModal() {
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return const CreateIdeaModal();
      //   },
      // );

      showCupertinoModalBottomSheet(
        expand: false,
        bounce: true,
        context: context,
        builder: (context) => const CreateIdeaModal(),
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appBloc.activePageTheme,
        onPressed: _openCreateIdeaModal,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Library",
          style: TextStyle(
            color: Color.fromARGB(255, 118, 117, 117),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RussTabBar(
            backgroundColor: Colors.white,
            controller: topTabControl,
            tabs: const <String>[
              "private",
              "shared",
              "public",
              "saved",
            ],
            animateTransitions: false,
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: libraryBloc.getMyIdeas(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                // if (false) {
                if (snapshot.hasData) {
                  List ideas = snapshot.data as List;

                  List sharedIdeas = ideas
                      .where((element) => element["type"] == "SHARED")
                      .toList();

                  List privateIdeas = ideas
                      .where((element) => element["type"] == "PRIVATE")
                      .toList();

                  List publicIdeas = ideas
                      .where((element) => element["type"] == "PUBLIC")
                      .toList();

                  return PageView(
                    controller: topTabControl,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      if (privateIdeas.isNotEmpty)
                        PrivateTab(privateIdeas: privateIdeas),
                      if (publicIdeas.isNotEmpty)
                        const Center(child: Text("shared")),
                      if (sharedIdeas.isNotEmpty)
                        const Center(child: Text("public")),
                      const Center(child: Text("saved")),
                    ],
                  );
                } else {
                  return Center(
                    child: LoadingAnimationWidget.twistingDots(
                      leftDotColor: const Color(0xFF1A1A3F),
                      rightDotColor: const Color(0xFFEA3799),
                      size: 30,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
