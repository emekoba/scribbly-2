import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scribbly/bloc/app_bloc.dart';
import 'package:scribbly/bloc/library_bloc.dart';
import 'package:scribbly/widgets/scribbly_textfield.dart';

class CreateIdeaModal extends StatefulWidget {
  const CreateIdeaModal({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateIdeaModal> createState() => _CreateIdeaModalState();
}

class _CreateIdeaModalState extends State<CreateIdeaModal> {
  bool _loading = false;
  String _newIdeaName = "";
  String _newIdeaDesc = "";

  @override
  Widget build(BuildContext context) {
    final AppController appBloc = Get.put(AppController());
    final LibraryController libraryBloc = Get.put(LibraryController());

    onSubmit() {
      if (_newIdeaName.isNotEmpty) {
        setState(() => _loading = true);

        libraryBloc
            .createIdea(name: _newIdeaName, description: _newIdeaDesc)
            .then((_) {
          setState(() => _loading = false);
          Get.back();
        });
      }
    }

    updateIdeaName(String name) {
      setState(() {
        _newIdeaName = name;
      });
    }

    updateIdeaDesc(String description) {
      setState(() {
        _newIdeaDesc = description;
      });
    }

    return SimpleDialog(
      contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      title: const Text(
        'New Idea',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      children: <Widget>[
        const SizedBox(width: 3000),
        ScribblyTextfield(
          height: 50,
          // width: 3000,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          type: ScribblyTextFieldTypes.name,
          hintText: 'Name',
          hintStyle: const TextStyle(color: Colors.grey),
          onChange: (val) => updateIdeaName(val),
        ),
        const SizedBox(height: 10),
        ScribblyTextfield(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          type: ScribblyTextFieldTypes.name,
          hintText: 'Description (Optional)',
          hintStyle: const TextStyle(color: Colors.grey),
          onChange: (val) => updateIdeaDesc(val),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: appBloc.activePageTheme,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: _loading ? null : onSubmit,
              child: _loading
                  ? LoadingAnimationWidget.newtonCradle(
                      color: appBloc.activePageTheme,
                      // leftDotColor: const Color(0xFF1A1A3F),
                      // rightDotColor: const Color(0xFFEA3799),
                      size: 30,
                    )
                  : const Text('Create'),
            ),
          ],
        )
      ],
    );
  }
}
