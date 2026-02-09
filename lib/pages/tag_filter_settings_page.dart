// tag_filter_settings_page.dart

import 'package:flutter/material.dart';

class TagFilterSettingsPage extends StatefulWidget {
  @override
  _TagFilterSettingsPageState createState() => _TagFilterSettingsPageState();
}

class _TagFilterSettingsPageState extends State<TagFilterSettingsPage> {
  List<String> tags = ['Tag1', 'Tag2', 'Tag3'];
  List<bool> selectedTags = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tag Filter Settings'),
      ),
      body: ListView.builder(
        itemCount: tags.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(tags[index]),
            value: selectedTags[index],
            onChanged: (bool? value) {
              setState(() {
                selectedTags[index] = value!;
              });
            },
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: TagFilterSettingsPage()));