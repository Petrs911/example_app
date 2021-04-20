import 'package:flutter/material.dart';
import 'package:flow_builder/flow_builder.dart';

import '../model/profile_model.dart';

class ProfileNameForm extends StatefulWidget {
  ProfileNameForm({Key key}) : super(key: key);

  @override
  _ProfileNameFormState createState() => _ProfileNameFormState();
}

class _ProfileNameFormState extends State<ProfileNameForm> {
  var _name = '';

  void handleFlow() {
    context.flow<Profile>().update(
      (profile) {
        return profile.copyWith(name: _name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => setState(() => _name = value),
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              ElevatedButton(
                child: const Text('Continue'),
                onPressed: _name.isNotEmpty ? handleFlow : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
