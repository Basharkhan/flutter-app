import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ],
      ),
    );
  }
}
