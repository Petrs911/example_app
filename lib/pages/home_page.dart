import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:example_app/model/profile_model.dart';
import '../profile_flow.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Profile> profileList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView(
        children: List.generate(profileList.length, (index) {
          final profile = profileList[index];
          return GestureDetector(
            onTap: () async {
              final profile =
                  await Navigator.of(context).push(ProfileFlow.route());
              setState(() {
                profileList[index] = profile;
              });
            },
            child: ListTile(
              title: Text('Name: ${profile.name}'),
              subtitle: Text('Weight is: ${profile.weight} kg'),
              trailing: Text('Age: ${profile.age}'),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final profile = await Navigator.of(context).push(ProfileFlow.route());
          setState(() {
            profileList.add(profile);
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
