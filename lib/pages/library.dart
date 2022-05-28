import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribbly/bloc/app_bloc.dart';
import 'package:scribbly/widgets/private_tab.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appBloc = Get.put(AppController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appBloc.activePageTheme,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const PrivateTab(),
          Container(child: const Center(child: Text("shared"))),
          Container(child: const Center(child: Text("public"))),
          Container(child: const Center(child: Text("saved"))),
        ],
      ),
    );
  }
}
