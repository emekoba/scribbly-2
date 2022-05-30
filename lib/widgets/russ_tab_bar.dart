import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribbly/bloc/app_bloc.dart';

class RussTabBar extends StatefulWidget {
  final PageController controller;
  final List tabs;
  final bool scrollable;
  final bool animateTransitions;
  final int? index;
  final bool web;
  final Color? backgroundColor;

  const RussTabBar({
    Key? key,
    this.web = false,
    required this.controller,
    required this.tabs,
    this.scrollable = false,
    this.animateTransitions = true,
    this.index,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _RussTabBarState createState() => _RussTabBarState();
}

class _RussTabBarState extends State<RussTabBar> {
  final Map<String, bool> _btns = {};
  final Duration pageDuration = const Duration(milliseconds: 200);
  final Curve pageCurve = Curves.bounceIn;
  final AppController appBloc = Get.put(AppController());

  int _getIndexOf(String tabValue) {
    int x = 0;
    int index = 0;

    _btns.forEach((key, value) {
      if (key == tabValue) {
        index = x;
      }
      x = x + 1;
    });

    return index;
  }

  void _selectTab(String name) {
    setState(() {
      _btns.forEach((String key, dynamic value) {
        if (key != name) {
          _btns[key] = false;
        }
      });
      _btns[name] = true;
    });

    if (widget.animateTransitions == true) {
      widget.controller.animateToPage(_getIndexOf(name),
          duration: pageDuration, curve: pageCurve);
    } else {
      widget.controller.jumpToPage(_getIndexOf(name));
    }
  }

  @override
  void initState() {
    int x = 0;

    setState(() {
      for (var e in widget.tabs) {
        _btns[e.toString()] = x == 0 ? true : false;
        x++;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> btnsForFixedRow = <Widget>[];

    () {
      double btnIndex = -1;

      _btns.forEach((key, value) {
        btnIndex++;

        return btnsForFixedRow.add(
          GestureDetector(
            onTap: () => _selectTab(key),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: _btns[key] == true
                    ? appBloc.activePageTheme
                    : Theme.of(context).scaffoldBackgroundColor,
              ),
              height: widget.web ? double.infinity : 32,
              width: 70,
              child: Center(
                child: Text(
                  key,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: _btns[key] == true
                            ? Colors.white
                            : appBloc.activePageTheme,
                      ),
                ),
              ),
            ),
          ),
        );
      });
    }();

    return Container(
      height: 50,
      decoration: BoxDecoration(color: widget.backgroundColor ?? Colors.white),
      child: widget.scrollable
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _btns.length,
              itemBuilder: (context, index) {
                String key = _btns.keys.elementAt(index);

                return GestureDetector(
                  onTap: () => _selectTab(key),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _btns[key] == true
                          ? appBloc.activePageTheme
                          : Theme.of(context).colorScheme.secondary,
                    ),
                    height: 32,
                    width: 70,
                    child: Center(
                      child: Text(
                        key,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: _btns[key] == true
                                  ? Colors.white
                                  : appBloc.activePageTheme,
                            ),
                      ),
                    ),
                  ),
                );
              })
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: btnsForFixedRow,
            ),
    );
  }
}
