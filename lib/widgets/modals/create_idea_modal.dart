import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scribbly/bloc/app_bloc.dart';
import 'package:scribbly/bloc/library_bloc.dart';
import 'package:scribbly/widgets/dismiss_keyboard.dart';
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
  bool _showCollaboratorPane = false;
  String _newIdeaName = "";
  String _newIdeaDesc = "";

  @override
  Widget build(BuildContext context) {
    final AppController appBloc = Get.put(AppController());
    final LibraryController libraryBloc = Get.put(LibraryController());

    _onSubmit() {
      if (_newIdeaName.isNotEmpty) {
        setState(() => _loading = true);

        libraryBloc
            .createIdea(name: _newIdeaName, description: _newIdeaDesc)
            .then((_) {
          setState(() => _loading = false);
          // Get.back();
        });
      }
    }

    _updateIdeaName(String name) {
      setState(() {
        _newIdeaName = name;
      });
    }

    _updateIdeaDesc(String description) {
      setState(() {
        _newIdeaDesc = description;
      });
    }

    _toggleAddCollaborator() {
      setState(() {
        _showCollaboratorPane = !_showCollaboratorPane;
      });
    }

    return DismissKeyboard(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const SizedBox(width: 3000),
                    ScribblyTextfield(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      type: ScribblyTextFieldTypes.name,
                      hintText: 'Name',
                      hintStyle: const TextStyle(color: Colors.grey),
                      onChange: (val) => _updateIdeaName(val),
                    ),
                    const SizedBox(height: 10),
                    ScribblyTextfield(
                      height: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      type: ScribblyTextFieldTypes.name,
                      hintText: 'Description (Optional)',
                      hintStyle: const TextStyle(color: Colors.grey),
                      onChange: (val) => _updateIdeaDesc(val),
                    ),
                    const SizedBox(height: 10),
                    ScribblyTextfield(
                      height: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      type: ScribblyTextFieldTypes.name,
                      hintText: 'Tags (Optional)',
                      hintStyle: const TextStyle(color: Colors.grey),
                      onChange: (val) => _updateIdeaDesc(val),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          fillColor: MaterialStateProperty.all(
                              appBloc.activePageTheme),
                          value: _showCollaboratorPane,
                          onChanged: (val) => _toggleAddCollaborator(),
                        ),
                        const Text(
                          'add collaborator(s)',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    _showCollaboratorPane
                        ? const SizedBox(
                            height: 200,
                            // width: double.infinity,
                          )
                        : Container(),
                  ],
                ),
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
                    onPressed:
                        _loading || _newIdeaName.isEmpty ? null : _onSubmit,
                    child: _loading
                        ? LoadingAnimationWidget.newtonCradle(
                            color: appBloc.activePageTheme,
                            size: 30,
                          )
                        : const Text('Create'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
