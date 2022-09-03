import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribbly/bloc/app_bloc.dart';

class TagList extends StatelessWidget {
  final List tags;

  const TagList({
    Key? key,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appBloc = Get.put(AppController());

    List<int> colors = [
      0xffe6194b,
      // 0xffEEDD82,
      //// 0xfff032e6,
      // 0xfffabebe,
      0xff008080,
      // 0xffe6beff,
      //// 0xff9a6324,
      //// 0xfffffac8,
      //// 0xff800000,
      // 0xffaaffc3,
      // 0xff808000,
      // 0xffffd8b1,
      0xff000075,
      // 0xff808080,
      //// 0xffffffff,
      //// 0xff3cb44b,
      // 0xff000000,
      0xfff58231,
      // 0xff911eb4,
      //// 0xff46f0f0,
      // 0xffffe119,
      // 0xff4363d8,
      // 0xffdd82ee,
      // 0xffbcf60c,
      0xff1A1A1A,
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 0),
      child: Wrap(
        children: tags
            .map(
              (dynamic title) => BoxChip(
                backgroundColor: appBloc.activePageTheme,
                // Color(_colors[Random().nextInt(_colors.length)]),
                label: Text(
                  title.toString(),
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class BoxChip extends StatelessWidget {
  final Widget label;
  final Color backgroundColor;

  const BoxChip({
    Key? key,
    required this.label,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: label,
      ),
    );
  }
}
