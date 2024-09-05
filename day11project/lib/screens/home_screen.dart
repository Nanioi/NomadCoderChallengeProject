import 'dart:async';

import 'package:day11project/screens/item_btn.dart';
import 'package:day11project/screens/stack_card_view.dart';
import 'package:day11project/theme/constant/app_colors.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const fiveMinutes = 5;
  static const fifteenMinutes = 15;
  static const twentyMinutes = 20;
  static const twentyFiveMinutes = 25;
  static const thirtyMinutes = 30;
  static const thirtyFiveMinutes = 35;
  final _controller = ScrollController();

  List<int> secondsList = [
    fifteenMinutes,
    twentyMinutes,
    twentyFiveMinutes,
    thirtyMinutes,
    thirtyFiveMinutes
  ];
  int selectedIndex = 2;

  int totalSeconds = twentyFiveMinutes * 60; // * 60
  String textM = '25';
  String textS = '00';
  bool isRunning = false;
  bool isRelaxing = false;

  int totalRounds = 0;
  int maxRounds = 4;

  int totalGoals = 0;
  int maxGoals = 12;

  late Timer timer;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        isRelaxing = !isRelaxing;
        if (isRelaxing) {
          // 5분 쉬는 시간
          totalSeconds = fiveMinutes * 60; //*60
          textM = fiveMinutes.toString();
          textS = '00';
        } else {
          totalRounds += 1;
          if (totalRounds == maxRounds) {
            totalGoals += 1;
            totalRounds = 0;
            onPausePressed();
          }
          totalSeconds = secondsList[selectedIndex] * 60; // *60
          textM = secondsList[selectedIndex].toString();
          textS = '00';
        }
      });
    } else {
      setState(() {
        totalSeconds -= 1;
        format(totalSeconds);
      });
    }
  }

  void onStartRelax() {
    //5분 쉬는 시간
    totalSeconds = fifteenMinutes * 60; // *60
  }

  void onStartPressed() {
    // 원하는 주기마다 다음 콜백 함수 실행
    // 1초마다
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void btnClickEvent(index) {
    if (isRunning) {
      onPausePressed();
    }
    setState(() {
      selectedIndex = index;
      totalSeconds = secondsList[index] * 60; // * 60
      textM = secondsList[index].toString();
      textS = '00';
    });
  }

  void format(int seconds) {
    var duration = Duration(seconds: seconds);
    var time = duration.toString().split('.').first.split(':');
    textM = time[1];
    textS = time[2];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorRed,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorRed,
        shadowColor: Colors.transparent,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'POMOTIMER',
            style: TextStyle(
                color: AppColors.colorWhite, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StackCardView(text: textM),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                          child: Text(
                            ':',
                            style: TextStyle(
                              height: 0.7,
                              color: Color.fromARGB(130, 255, 255, 255),
                              fontSize: 70,
                            ),
                          ),
                        ),
                        StackCardView(text: textS),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Stack(
                    children: [
                      ClipRect(
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(
                                    0.1), // Adjust transparency for fade
                                Colors.black.withOpacity(
                                    0.1), // Adjust transparency for fade
                                Colors.transparent,
                              ],
                              stops: const [0.0, 0.1, 0.9, 1.0],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstOut,
                          child: FadingEdgeScrollView.fromScrollView(
                            gradientFractionOnStart: 0.3,
                            gradientFractionOnEnd: 0.3,
                            child: ListView.builder(
                              controller: _controller,
                              scrollDirection: Axis.horizontal,
                              itemCount: secondsList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () => btnClickEvent(index),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 25, horizontal: 8.0),
                                      child: ItemBtn(secondsList[index], index,
                                          (selectedIndex == index)),
                                    ));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.2), // Semi-transparent background
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: IconButton(
                    iconSize: 60,
                    color: AppColors.colorWhite,
                    onPressed: () =>
                        isRunning ? onPausePressed() : onStartPressed(),
                    icon: Icon(
                      isRunning
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(90, 0, 90, 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$totalRounds/$maxRounds',
                        style: const TextStyle(
                            fontSize: 25,
                            color: AppColors.colorWhiteOpacity,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'ROUND',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$totalGoals/$maxGoals',
                        style: const TextStyle(
                            fontSize: 25,
                            color: AppColors.colorWhiteOpacity,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'GOAL',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
