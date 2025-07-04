import 'package:flutter/material.dart';
import 'package:student_management/core/colors.dart';
import 'package:student_management/model/task_model.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.topCenter,
          color: kCardColor,
          height: size.height,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.grey),
                    const SizedBox(width: 15),
                    RichText(
                      text: TextSpan(
                        text: "Oct",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: secondTextColor,
                        ),
                        children: [
                          TextSpan(
                            text: " 2023",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                              color: secondTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "Today",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: secondTextColor,
                    fontSize: 18,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 125,
          child: Container(
            height: size.height - 160,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CalendarItem(weekDay: "Mon", date: 2, isActive: false),
                      CalendarItem(weekDay: "Tue", date: 3, isActive: false),
                      CalendarItem(weekDay: "Wed", date: 4, isActive: true),
                      CalendarItem(weekDay: "Thu", date: 5, isActive: false),
                      CalendarItem(weekDay: "Fri", date: 6, isActive: false),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(tasks.length, (index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 25),

                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  SizedBox(
                                    width: size.width / 1.15,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                      ]
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CalendarItem extends StatelessWidget {
  final String weekDay;
  final int date;
  final bool isActive;

  const CalendarItem({
    super.key,
    required this.weekDay,
    required this.date,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? secondTextColor : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 75,
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weekDay,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            date.toString(),
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
