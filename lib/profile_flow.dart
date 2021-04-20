import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

import 'model/profile_model.dart';
import 'pages/profile_age_form.dart';
import 'pages/profile_name_form.dart';
import 'pages/profile_weight.dart';

class ProfileFlow extends StatelessWidget {
  static Route<Profile> route() {
    return MaterialPageRoute(
      builder: (context) {
        return ProfileFlow();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<Profile>(
      state: Profile(),
      onGeneratePages: onGeneratePages,
    );
  }

  List<Page> onGeneratePages(Profile profile, List<Page> pages) {
    return [
      MaterialPage(child: ProfileNameForm()),
      if (profile.name != null) MaterialPage(child: ProfileAgeForm()),
      if (profile.age != null) MaterialPage(child: ProfileWeightForm()),
    ];
  }
}
