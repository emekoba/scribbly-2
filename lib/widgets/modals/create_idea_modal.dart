import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribbly/bloc/app_bloc.dart';
import 'package:scribbly/widgets/scribbly_textfield.dart';

class CreateIdeaModal extends StatefulWidget {
  const CreateIdeaModal({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateIdeaModal> createState() => _CreateIdeaModalState();
}

class _CreateIdeaModalState extends State<CreateIdeaModal> {
  String _newIdeaName = "";
  String _newIdeaDesc = "";

  @override
  Widget build(BuildContext context) {
    final AppController appBloc = Get.put(AppController());

    createIdea() {}

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
        ),
      ),
      children: <Widget>[
        ScribblyTextfield(
          height: 50,
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
              onPressed: createIdea,
              child: const Text('Create'),
            ),
          ],
        )
      ],
    );
  }
}
