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
        prefs.getStringList('time') == null) {
      prefs.setStringList('data', currData);
      prefs.setStringList('date2', currData2);
      prefs.setStringList('time', currData3);
    } else {
      currData2 = prefs.getStringList('date2') as List<String>;
      currData = prefs.getStringList('data') as List<String>;
      currData3 = prefs.getStringList('time') as List<String>;
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
    // prefs.setStringList('data', currData);
    currData2 = prefs.getStringList('date2') as List<String>;
    // currData = prefs.getStringList('date2') as List<String>;
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
    // TODO: implement initState
    setState(() {
      // removeData1(0);
      // removeData1(1);
      GetData1();
    });

    super.initState();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.grey[100],
        child: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.of(context).push(
                //           MaterialPageRoute(builder: (context) => AddNote()));
                //     },
                //     child: Text('Add')),

                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: currData.length,
                    // reverse: true,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // removeData1(currData.length - index - 1);
                          // removeData2(currData.length - index - 1);
                          // removeData3(currData.length - index - 1);
                          // removeDat(index);
                          print(currData.length - index - 1);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => EditNote(
                                  index: currData.length - index - 1))));
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          child: TodoCard(
                              date: currData2[currData.length - index - 1],
                              time: currData3[currData.length - index - 1],
                              notes: currData[currData.length - index - 1]),
                        ),
                      );
                    },
                  ),
                ),
                // Expanded(
                //     child: GridView.count(
                //       crossAxisCount: 2,
                //       crossAxisSpacing: 4.0,
                //       mainAxisSpacing: 8.0,
                //       children: ListView.(
                // itemCount: 5,
                // itemBuilder: (BuildContext context, int index) {
                //   return ListTile(
                //       leading: const Icon(Icons.list),
                //       trailing: const Text(
                //         "GFG",
                //         style: TextStyle(color: Colors.green, fontSize: 15),
                //       ),
                //       title: Text("List item $index"));
                // }),
                //       children: [
                //         TodoCard(
                //           date:
                //               '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                //           time:
                //               '${DateTime.now().hour % 12}:${DateTime.now().minute < 10 ? '0' : ''}${DateTime.now().minute}${DateTime.now().hour / 12 < 1 ? ' AM' : ' PM'}',
                //           notes:
                //               'Hello Wolrd My Ne, is ayush Kumar Singh And I Study In Thapar Institute of Enginering And Technology',
                //         ),
                //         TodoCard(
                //             date: '${DateTime.now().day}',
                //             time: '${DateTime.now().hour}',
                //             notes:
                //                 'Hello Wolrd My Ne, is ayush Kumar Singh And I Study In Thapar Institute of Enginering And Technology'),
                //         TodoCard(
                //             date: '${DateTime.now().day}',
                //             time: '${DateTime.now().hour}',
                //             notes:
                //                 'Hello Wolrd My Ne, is ayush Kumar Singh And I Study In Thapar Institute of Enginering And Technology'),
                //         TodoCard(
                //             date: '${DateTime.now().day}',
                //             time: '${DateTime.now().hour}',
                //             notes:
                //                 'Hello Wolrd My Ne, is ayush Kumar Singh And I Study In Thapar Institute of Enginering And Technology'),
                //         TodoCard(
                //             date: '${DateTime.now().day}',
                //             time: '${DateTime.now().hour}',
                //             notes:
                //                 'Hello Wolrd My Ne, is ayush Kumar Singh And I Study In Thapar Institute of Enginering And Technology'),
                //         TodoCard(
                //             date: '${DateTime.now().day}',
                //             time: '${DateTime.now().hour}',
                //             notes:
                //                 'Hello Wolrd My Ne, is ayush Kumar Singh And I Study In Thapar Institute of Enginering And Technology'),
                //         TodoCard(
                //             date: '${DateTime.now().day}',
                //             time: '${DateTime.now().hour}',
                //             notes:
                //                 'Hello Wolrd My Ne, is ayush Kumar Singh And I Study In Thapar Institute of Enginering And Technology'),
                //         // Container(
                //         //     height: 200,
                //         //     width: MediaQuery.of(context).size.width / 2.2,
                //         //     color: Colors.grey[100],
                //         //     child: Text("helllo Wolrd")),
                //         // Container(
                //         //     height: 200,
                //         //     width: MediaQuery.of(context).size.width / 2.2,
                //         //     color: Colors.grey[100],
                //         //     child: Text("helllo Wolrd")),
                //         // Container(
                //         //     height: 200,
                //         //     width: MediaQuery.of(context).size.width / 2.2,
                //         //     color: Colors.grey[100],
                //         //     child: Text("helllo Wolrd")),
                //         // Container(
                //         //     height: 200,
                //         //     width: MediaQuery.of(context).size.width / 2.2,
                //         //     color: Colors.grey[100],
                //         //     child: Text("helllo Wolrd")),
                //         // Container(
                //         //   height: 200,
                //         //   width: MediaQuery.of(context).size.width / 2.2,
                //         //   color: Colors.grey[100],
                //         //   child: Text("helllo Wolrd"),
                //         // ),
                //       ],
                // ),
                // ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.14,
              left: MediaQuery.of(context).size.width / 1.23,
              child: FloatingActionButton(
                  elevation: 10,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddNote()));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  )),
            )
          ]),
        ));
  }
}
