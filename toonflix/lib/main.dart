import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';

void main() {
  // dart 모든 프로그램의 시작점
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818), // == fromARGB, fromRGBO
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // 수평방향
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end, // 수평, row와 반대이다.
                    children: [
                      const Text(
                        'Hey,Selena',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.white.withOpacity(
                              0.8), // == Color.fromRGBO(255,255,255,0.8)
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '\$5 194 482',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // child 끼리 간격 최대한 멀어지게
                children: [
                  MyButton(
                    text: "Transfer",
                    bgColor: Color(0xFFF1B33B),
                    textColor: Colors.black,
                  ),
                  MyButton(
                    text: "Request",
                    bgColor: Color(0xFF1F2123),
                    textColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 수평
                crossAxisAlignment: CrossAxisAlignment.end, // 수직
                children: [
                  const Text(
                    "Wallets",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2123),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Euro',
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                '6 428',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'EUR',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 20),
                              ),
                            ],
                          )
                        ],
                      ),
                      Transform.scale(
                        // icon 크기 변경
                        scale: 2.2,
                        child: Transform.translate(
                          // icon 위치 이동
                          offset: const Offset(-5, 12),
                          child: const Icon(
                            Icons.euro_rounded,
                            color: Colors.white,
                            size: 88,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
