import 'package:flutter/material.dart';
import 'package:flow_builder/flow_builder.dart';

import '../model/profile_model.dart';

class ProfileWeightForm extends StatefulWidget {
  ProfileWeightForm({Key key}) : super(key: key);

  @override
  _ProfileWeightForm createState() => _ProfileWeightForm();
}

class _ProfileWeightForm extends State<ProfileWeightForm> {
  int _weight;

  void handleFlow() {
    context.flow<Profile>().complete(
      (profile) {
        return profile.copyWith(weight: _weight);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) =>
                    setState(() => _weight = int.parse(value)),
                decoration: const InputDecoration(
                  labelText: 'Weight',
                ),
              ),
              ElevatedButton(
                child: const Text('Continue'),
                onPressed: _weight != null ? handleFlow : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
