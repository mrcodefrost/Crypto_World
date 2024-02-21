import 'package:crypto_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => deskHeaderIntro(),
      mobile: (BuildContext context) => mobHeaderIntro(),
    );
  }
}

Widget deskHeaderIntro() {
  return SizedBox(
    width: screenWidth,
    child: Center(
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        color: Colors.transparent,
        child: const Text(
          'Top 100 Cryptocurrencies by Market Cap right now',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
      ),
    ),
  );
}

Widget mobHeaderIntro() {
  return Container();
}
