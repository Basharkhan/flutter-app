import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController nameController = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: nameController,
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              Text(nameController.text),
              Checkbox(
                tristate: true,
                value: isChecked,
                onChanged: (bool? value) => setState(() => isChecked = value),
              ),
              CheckboxListTile(
                tristate: true,
                title: Text("Is it true?"),
                value: isChecked,
                onChanged: (bool? value) => setState(() => isChecked = value),
              ),
              Switch(
                value: isSwitched,
                onChanged: (bool value) => setState(() => isSwitched = value),
              ),
              SwitchListTile(
                title: Text("Is it true?"),
                value: isSwitched,
                onChanged: (bool value) => setState(() => isSwitched = value),
              ),
              Slider(
                value: sliderValue,
                min: 0,
                max: 100,
                divisions: 100,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  child: Center(child: Text("Tap me")),
                ),
                onTap: () {
                  print("Image selected");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
