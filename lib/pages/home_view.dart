import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:scribbly/bloc/app_bloc.dart';
import 'package:scribbly/pages/feed.dart';
import 'package:scribbly/pages/library.dart';
import 'package:scribbly/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();

  int _pageIndex = 0;

  // final Duration _duration = const Duration(seconds: 1);

  final _footerIcons = {
    "library": {
      "icon": FontAwesomeIcons.feather,
      "size": 18.0,
      "theme": Colors.redAccent,
    },
    "feed": {
      "icon": FontAwesomeIcons.house,
      "size": 18.0,
      "theme": Colors.blueAccent,
    },
    "search": {
      "icon": FontAwesomeIcons.magnifyingGlass,
      "size": 18.0,
      "theme": const Color(0xff243447),
    },
    "profile": {
      "icon": Icons.face_rounded,
      "size": 20.0,
      "theme": Colors.green,
    },
    "notifications": {
      "icon": FontAwesomeIcons.paperPlane,
      "size": 18.0,
      "theme": const Color(0xff800000)
    },
  };

  @override
  Widget build(BuildContext context) {
    final AppController appBloc = Get.put(AppController());

    void _changePage(int index) {
      _pageController.jumpToPage(index);
      setState(() => _pageIndex = index);
      appBloc.updateAppTheme(
        themeColor: _footerIcons[_footerIcons.keys.toList()[index]]!["theme"],
      );
    }

    _footerIcons.entries.map((entry) {
      inspect(entry);
    });

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(children: [
          Builder(builder: (context) {
            return Expanded(
              child: Row(children: [
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) => _changePage(index),
                    controller: _pageController,
                    children: [
                      const Library(),
                      const Feed(),
                      Container(),
                      Container(),
                      Container()
                    ],
                  ),
                )
              ]),
            );
          })
        ]),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor,
          ),
          child: BottomNavigationBar(
            elevation: 3,
            currentIndex: _pageIndex,
            onTap: (index) => _changePage(index),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: _footerIcons.keys.indexedMap(
              (key, idx) {
                return BottomNavigationBarItem(
                  label: key,
                  icon: Icon(
                    _footerIcons[key]!["icon"] as IconData,
                    size: _footerIcons[key]!["size"] as double,
                    color: _pageIndex == idx
                        ? _footerIcons[key]!["theme"] as Color
                        : Theme.of(context).colorScheme.secondary,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
