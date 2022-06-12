import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribbly/bloc/app_bloc.dart';
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
    final PageController topTabControl = PageController();

    void _openCreateIdeaModal() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CreateIdeaModal();
        },
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
            child: PageView(
              controller: topTabControl,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const PrivateTab(),
                Container(child: const Center(child: Text("shared"))),
                Container(child: const Center(child: Text("public"))),
                Container(child: const Center(child: Text("saved"))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
