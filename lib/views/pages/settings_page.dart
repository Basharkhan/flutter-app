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
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Hello"),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Text("Open Snackbar"),
              ),
              Divider(
                color: Colors.green,
                thickness: 2.0,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text("Alert Title"),
                      content: Text("Alert Content"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Close"),
                        )
                      ],
                    );
                  },);
                },
                child: Text("Open Dialog"),
              ),
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
