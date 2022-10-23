import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:onboarding/home.dart';
import 'package:onboarding/model.dart';

import 'SharedPreferences/CacheHelper.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
        pageController: pageController,
        onSkip: () {},
        onDone: () {},
        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color: Colors.deepOrange,
          fontSize: 18,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.15,
        ),
        descriptionStyles: TextStyle(
          fontSize: 16,
          color: Colors.brown.shade300,
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Colors.deepOrangeAccent,
          activeColor: Colors.deepOrange,
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: Container(),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return !state.isLastPage
                ? nextAndEnd(state, context,
                    onTap: () => onNextTap(state, context), text: "التالي")
                : nextAndEnd(state, context,
                    onTap: () => gotoLoginPage(context: context), text: "تم");
          },
        ),
      ),
    );
  }
}

void gotoLoginPage({context}) {
  CacheHelper.saveData(
    key: 'onBoarding',
    value: true,
  ).then((value) {
    print("hello");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => Home()));
  });
}

Widget nextAndEnd(state, context, {void Function()? onTap, String? text}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        width: 230,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Colors.redAccent, Colors.deepOrangeAccent],
          ),
        ),
        child: Text(
          text!,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
