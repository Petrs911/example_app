import 'package:example_app/globals.dart';
import 'package:flutter/material.dart';
import 'package:flow_builder/flow_builder.dart';

import 'package:example_app/model/profile_model.dart';

class ProfileAgeForm extends StatefulWidget {
  ProfileAgeForm({Key key}) : super(key: key);

  @override
  _ProfileAgeFormState createState() => _ProfileAgeFormState();
}

class _ProfileAgeFormState extends State<ProfileAgeForm> {
  TextEditingController _controller = TextEditingController();
  int _age;

  void handleFlow() {
    context.flow<Profile>().update(
      (profile) {
        return profile.copyWith(age: _age);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (globalIndex != null && profileList[globalIndex].age != null) {
      _age = profileList[globalIndex].age;
      _controller = TextEditingController(text: '$_age');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                onChanged: (value) => setState(() => _age = int.parse(value)),
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
              ),
              ElevatedButton(
                child: const Text('Continue'),
                onPressed: _age != null ? handleFlow : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
