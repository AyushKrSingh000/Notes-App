// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'coloor.dart';

class TodoCard extends StatefulWidget {
  String date;
  String time;
  String notes;
  int col2;

  TodoCard(
      {super.key,
      required this.date,
      required this.time,
      required this.notes,
      required this.col2});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: Container(
          decoration: BoxDecoration(
              color: setD(widget.col2),
              borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width / 2.3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 120,
                  child: Text(
                    widget.notes,
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.fade,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      widget.date,
                      style: const TextStyle(fontSize: 17),
                    ),
                    const Text(
                      ' , ',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      widget.time,
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
