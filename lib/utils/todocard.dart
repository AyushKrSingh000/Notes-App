// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  String date;
  String time;
  String notes;

  TodoCard(
      {super.key, required this.date, required this.time, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width / 2.3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 120,
                  child: Text(
                    notes,
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.fade,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(fontSize: 17),
                    ),
                    const Text(
                      ' , ',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 17),
                    ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
