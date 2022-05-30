import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribbly/bloc/app_bloc.dart';
import 'package:scribbly/enums.dart';
import 'package:scribbly/widgets/tag_list.dart';

class Post extends StatelessWidget {
  final String id;
  final String name;
  final List? tags;
  final String username;
  final AssetImage? userdp;
  final String? date;
  final String? description;
  final Map? cover;
  final IdeaTypes ideaType;

  const Post({
    Key? key,
    required this.id,
    required this.name,
    required this.ideaType,
    required this.username,
    this.tags,
    this.userdp,
    this.date,
    this.description,
    this.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appBloc = Get.put(AppController());

    void _openIdea() {
      // Navigator.of(context).push<dynamic>(PageTransition(
      //     type: PageTransitionType.slideInLeft,
      //     child: IdeaPage(
      //         pageTheme: pageTheme, name: name, structure: structure)));

      // Navigator.pushNamed(context, '/idea-page', arguments: {
      //   'name': name,
      //   'tags': tags,
      //   'username': username,
      //   'date': date,
      //   'description': description,
      //   'cover': cover,
      //   'structure': structure,
      //   'pageTheme': pageTheme,
      //   'userdp': userdp
      // });
    }

    void _openIdeaOptions() {
      // showModalBottomSheet<Widget>(
      //     backgroundColor: Theme.of(context).primaryColor,
      //     context: context,
      //     builder: (context) {
      //       return PostOptions();
      //     });
    }

    return GestureDetector(
      onTap: _openIdea,
      onLongPress: _openIdeaOptions,
      child: Container(
        // height: 100,
        // width: 200,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
        constraints: const BoxConstraints(minHeight: 100),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Offstage(
                offstage: tags == null,
                child: TagList(
                  tags: tags ?? [],
                ),
              ),
              Text(
                description ?? "",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 13,
                      height: 1.5,
                    ),
              ),
              const SizedBox(height: 30),
              Offstage(
                offstage: ideaType == "private" || ideaType == "shared",
                child: Row(
                  children: [
                    Icon(
                      Icons.face_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 20,
                    ),
                    Expanded(child: Container()),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_upward_rounded,
                              color: appBloc.activePageTheme,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "2k",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 12,
                                ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_downward_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 20,
                            ),
                          )
                        ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            "Delete idea",
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          Text(
            "change to shared",
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ],
      ),
    );
  }
}
