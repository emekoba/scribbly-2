import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribbly/bloc/app_bloc.dart';
import 'package:scribbly/widgets/private_tab.dart';
import 'package:scribbly/widgets/russ_tab_bar.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appBloc = Get.put(AppController());
    final PageController topTabControl = PageController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appBloc.activePageTheme,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Library",
          style: TextStyle(color: Colors.black),
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
