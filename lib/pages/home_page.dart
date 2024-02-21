import 'package:crypto_tracker/pages/coin_tracker.dart';
import 'package:crypto_tracker/pages/exchange_tracker_page.dart';
import 'package:crypto_tracker/pages/header.dart';
import 'package:crypto_tracker/pages/nft_tracker_page.dart';
import 'package:crypto_tracker/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  int currentIndex = 0;

  void navigateToPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> pages = [
    CoinTracker(),
    ExchangeTrackerPage(),
    NftTrackerPage(),
    const Center(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Developed by Daksh',
            style: TextStyle(fontSize: 35),
          ),
          SelectionArea(
            child: Text(
              'For feedback and suggestions, mail at mr.codefrost@gmail.com',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 12));

    _topAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
    ]).animate(_controller);
    _bottomAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(10),
              child: Image.asset(logo),
            ),
            const SizedBox(width: 10),
            const Text(
              'CryptoWorld',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 27,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              navigateToPage(0);
            },
            child: const Text(
              'Cryptocurrencies',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () {
              navigateToPage(1);
            },
            child: const Text(
              'Exchanges',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () {
              navigateToPage(2);
            },
            child: const Text(
              'NFTs',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () {
              navigateToPage(3);
            },
            child: const Text(
              'About',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Container(
                // height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // Color(0xff011638),
                      Colors.deepPurple,
                      Colors.deepPurple.shade200
                    ],
                    begin: _topAlignmentAnimation.value,
                    end: _bottomAlignmentAnimation.value,
                  ),
                ),
                child: ListView(
                  children: [
                    const Header(),
                    const SizedBox(
                      height: 30,
                    ),
                    pages[currentIndex],
                  ],
                ));
          }),
    );
  }
}
