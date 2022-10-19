import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';

import 'home.dart';

final PageController pageController = PageController();
void onNextTap(OnBoardState onBoardState, context) {
  if (!onBoardState.isLastPage) {
    pageController.animateToPage(
      onBoardState.page + 1,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOutSine,
    );
  } else {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة",
    description:
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من",
    imgUrl: "assets/images/onboard1.jpg",
  ),
  const OnBoardModel(
    title:
        "ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً",
    description:
        "دور مولد النص العربى أن يوفر على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم فيظهر بشكل لا يليق.",
    imgUrl: 'assets/images/onboard2.jpg',
  ),
  const OnBoardModel(
    title:
        "هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ",
    description:
        "هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.",
    imgUrl: 'assets/images/onboard3.jpg',
  ),
];
