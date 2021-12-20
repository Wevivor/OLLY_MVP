import 'package:flutter/material.dart';
import 'package:sorty/utils/custom_color.dart';

class CalendarCell extends StatelessWidget {
  const CalendarCell({
    Key? key,
    this.selected = false,
    required this.date,
  }) : super(key: key);
  final bool selected;
  final String date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: selected ? CustomColor.PRIMARY_COLOR : Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date,
                style: TextStyle(
                    fontSize: 12,
                    color: selected ? Colors.white : Colors.black),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: 20,
                height: 14,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: selected
                            ? Colors.white
                            : CustomColor.PRIMARY_COLOR),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                          fontSize: 8,
                          color: selected
                              ? Colors.white
                              : Colors.black.withOpacity(0.7)),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
