import 'package:flutter/material.dart';

import '../globals.dart';
import '../profile_flow.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView(
        children: List.generate(profileList.length, (index) {
          final oldProfile = profileList[index];

          return GestureDetector(
            onTap: () async {
              globalIndex = index;
              final newProfile =
                  await Navigator.of(context).push(ProfileFlow.route());
              setState(() {
                profileList[index] = newProfile;
              });
            },
            child: ListTile(
              title: Text('Name: ${oldProfile.name}'),
              subtitle: Text('Weight is: ${oldProfile.weight} kg'),
              trailing: Text('Age: ${oldProfile.age}'),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          globalIndex = null;
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
