import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:onboarding/home.dart';
import 'package:onboarding/model.dart';
import 'package:onboarding/onBoarding.dart';

import 'SharedPreferences/CacheHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.GetSaveData(key: 'onBoarding');
  Widget widget;
  if (onBoarding != null) {
    widget = Home();
  } else
    widget = OnBoarding();

  runApp(App(startwidget: widget));
}

class App extends StatelessWidget {
  final Widget? startwidget;

  App({
    this.startwidget,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: startwidget,
    );
  }
}
