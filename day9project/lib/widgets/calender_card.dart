import 'package:flutter/material.dart';

class CalenderCard extends StatelessWidget {
  final String startH;
  final String startM;
  final String endH;
  final String endM;
  final String schedule;
  final List<String> participants;
  final Color bgColor;

  const CalenderCard({
    super.key,
    required this.startH,
    required this.startM,
    required this.endH,
    required this.endM,
    required this.schedule,
    required this.participants,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 215,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          startH,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              height: 0.8,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          startM,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Container(
                            width: 1,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Text(
                          endH,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              height: 0.8,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          endM,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: SizedBox(
                        height: 150,
                        child: Text(
                          schedule,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: const TextStyle(
                              color: Colors.black,
                              height: 0.9, // 줄간격
                              fontSize: 63,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: participants.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        participants[index],
                        style: TextStyle(
                          fontSize: 18,
                          color: participants[index] == 'ME'
                              ? Colors.black
                              : Colors.black.withOpacity(0.5),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
