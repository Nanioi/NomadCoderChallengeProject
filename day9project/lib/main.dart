import 'package:day9project/widgets/calender_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 34, 33, 33), // == fromARGB, fromRGB
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'assets/images/IMG_9193.JPG',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Icon(
                  Icons.add_outlined,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              "MONDAY 16",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "TODAY",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      height: 0.8,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Text(
                "∙",
                style: TextStyle(
                    color: Color.fromARGB(255, 222, 66, 217),
                    fontSize: 50,
                    fontWeight: FontWeight.w600),
              ),
              Expanded(
                // 남은 공간을 모두 차지하도록 Expanded 사용
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "${17 + index}", // 시작 날짜를 17로 설정
                            style: TextStyle(
                                height: 1.0,
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 48,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CalenderCard(
                    startH: '11',
                    startM: '30',
                    endH: '12',
                    endM: '20',
                    schedule: 'DESIGN\nMEETING',
                    participants: ['ALEX', 'HELENA', 'NANA'],
                    bgColor: Color.fromARGB(255, 251, 244, 113),
                  ),
                  CalenderCard(
                    startH: '12',
                    startM: '35',
                    endH: '14',
                    endM: '10',
                    schedule: 'DAILY\nPROJECT',
                    participants: ['ME', 'RICHARD', 'CIRY', '+4'],
                    bgColor: Color.fromARGB(255, 188, 140, 248),
                  ),
                  CalenderCard(
                    startH: '15',
                    startM: '00',
                    endH: '16',
                    endM: '30',
                    schedule: 'WEEKLY\nPLANNING',
                    participants: ['DEN', 'NANA', 'MARK'],
                    bgColor: Color.fromARGB(255, 217, 252, 192),
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
