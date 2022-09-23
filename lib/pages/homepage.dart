// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/pages/addPage.dart';
import 'package:todo/pages/editPage.dart';
import 'package:todo/utils/todocard.dart';

// List<String> newData = [];
List<String> oldData = [];
List<String> currData = ['Hello Welcome TO Notes App'];
List<String> oldData2 = [];
List<String> currData2 = ['20/09/2022'];
List<String> oldData3 = [];
List<String> currData3 = ['5:40 PM'];
List<String> currDa = ['0'];
List<int> colorData = [0];

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class _TodoHomePageState extends State<TodoHomePage> {
  void GetData1() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getStringList('data') == null ||
        prefs.getStringList('date2') == null ||
        prefs.getStringList('time') == null ||
        prefs.getStringList('color') == null) {
      prefs.setStringList('data', currData);
      prefs.setStringList('date2', currData2);
      prefs.setStringList('time', currData3);
      prefs.setStringList('color', currDa);
      setState(() {});
    } else {
      currData2 = prefs.getStringList('date2') as List<String>;
      currData = prefs.getStringList('data') as List<String>;
      currData3 = prefs.getStringList('time') as List<String>;
      List<String> temp = prefs.getStringList('color') as List<String>;
      colorData = temp.map((i) => int.parse(i)).toList();
      print(colorData);
      setState(() {});
    }

    setState(() {});
  }

  void removeData1(int index) async {
    final SharedPreferences prefs = await _prefs;
    currData = prefs.getStringList('data') as List<String>;
    currData.removeAt(index);
    prefs.setStringList('data', currData);
    currData = prefs.getStringList('data') as List<String>;
    setState(() {});
  }

  void removeData3(int index) async {
    final SharedPreferences prefs = await _prefs;
    currData3 = prefs.getStringList('time') as List<String>;
    currData3.removeAt(index);
    prefs.setStringList('time', currData3);
    currData3 = prefs.getStringList('time') as List<String>;
    setState(() {});
  }

  void removeData2(int index) async {
    final SharedPreferences prefs = await _prefs;
    currData2 = prefs.getStringList('date2') as List<String>;
    currData2.removeAt(index);
    prefs.setStringList('date2', currData2);
    currData2 = prefs.getStringList('date2') as List<String>;
    currDa = prefs.getStringList('color') as List<String>;
    currDa.removeAt(index);
    prefs.setStringList('color', currDa);
    currDa = prefs.getStringList('color') as List<String>;
    colorData = currDa.map((i) => int.parse(i)).toList();
    setState(() {});
  }

  void removeDat(int index) async {
    final SharedPreferences prefs = await _prefs;
    currData2 = prefs.getStringList('date2') as List<String>;
    currData2.removeRange(0, currData2.length);
    currData = prefs.getStringList('data') as List<String>;
    currData.removeRange(0, currData.length);
    currData3 = prefs.getStringList('time') as List<String>;
    currData3.removeRange(0, currData.length);
    prefs.setStringList('time', currData3);
    prefs.setStringList('date2', currData2);
    prefs.setStringList('data', currData);
    currData3 = prefs.getStringList('time') as List<String>;
    currData2 = prefs.getStringList('date2') as List<String>;
    currData = prefs.getStringList('data') as List<String>;
    setState(() {});
  }

  @override
  void initState() {
    setState(() {
      GetData1();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.grey[100],
        child: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: currData.length,
                    // reverse: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onLongPress: () {
                          setState(() {
                            removeData1(currData.length - index - 1);
                            removeData2(currData.length - index - 1);
                            removeData3(currData.length - index - 1);
                          });
                        },
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 800),
                              pageBuilder: (_, __, ___) => EditNote(
                                  index: currData.length - index - 1)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          child: Hero(
                            tag: currData.length - index - 1,
                            child: TodoCard(
                                col2: colorData[currData.length - index - 1],
                                date: currData2[currData.length - index - 1],
                                time: currData3[currData.length - index - 1],
                                notes: currData[currData.length - index - 1]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.14,
              left: MediaQuery.of(context).size.width / 1.23,
              child: FloatingActionButton(
                  elevation: 10,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddNote()));
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  )),
            )
          ]),
        ));
  }
}
