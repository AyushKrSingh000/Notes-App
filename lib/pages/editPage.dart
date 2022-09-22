// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/ColoredBosed.dart';
import '../utils/coloor.dart';
import 'homepage.dart';

String Name2 = '';

// ignore: must_be_immutable
class EditNote extends StatefulWidget {
  int index;
  EditNote({super.key, required this.index});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  void setStringLt(String desc) async {
    final SharedPreferences prefs = await _prefs;
    currData = prefs.getStringList('data') as List<String>;

    currData[widget.index] = desc;
    prefs.setStringList('data', currData);
    currData = prefs.getStringList('data') as List<String>;
    setState(() {});
  }

  void setStringL() async {
    final SharedPreferences prefs = await _prefs;
    currData2 = prefs.getStringList('date2') as List<String>;
    currData2[widget.index] =
        '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
    prefs.setStringList('date2', currData2);
    currData2 = prefs.getStringList('date2') as List<String>;
    setState(() {});
  }

  void setStringL2() async {
    final SharedPreferences prefs = await _prefs;
    currData3 = prefs.getStringList('time') as List<String>;
    currData3[widget.index] =
        '${DateTime.now().hour % 12}:${DateTime.now().minute < 10 ? '0' : ''}${DateTime.now().minute}${DateTime.now().hour / 12 < 1 ? ' AM' : ' PM'}';
    prefs.setStringList('time', currData3);
    currData3 = prefs.getStringList('time') as List<String>;
    setState(() {});
  }

  @override
  void initState() {
    Name2 = currData[widget.index];
    setState(() {});
    super.initState();
  }

  void setColor2(String de) async {
    final SharedPreferences prefs = await _prefs;
    currDa = prefs.getStringList('color') as List<String>;
    currDa[widget.index] = de;
    prefs.setStringList('color', currDa);
    setState(() {});
    colorData = currDa.map((i) => int.parse(i)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        return Future.delayed(Duration.zero);
      },
      child: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        setColor2('1');
                      },
                      child: ColoredBox2(color: Colors.amber[100] as Color)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        setColor2('2');
                      },
                      child:
                          ColoredBox2(color: Colors.lightGreen[100] as Color)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        setColor2('3');
                      },
                      child:
                          ColoredBox2(color: Colors.lightBlue[100] as Color)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        setColor2('4');
                      },
                      child: ColoredBox2(color: Colors.orange[100] as Color)),
                  const SizedBox(width: 20),
                  InkWell(
                      onTap: () {
                        setColor2('5');
                      },
                      child:
                          ColoredBox2(color: Colors.redAccent[100] as Color)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Hero(
                tag: widget.index,
                child: Material(
                  child: Container(
                    // height: 200,
                    height: 700,
                    width: 380,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(20),
                        color: setD(colorData[widget.index])),
                    child: TextFormField(
                      maxLines: 200,
                      initialValue: Name2,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          Name2 = value;
                        });
                        setStringLt(Name2);
                        setStringL();
                        setStringL2();
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       setStringLt(Name2);

              //       Navigator.pushNamedAndRemoveUntil(
              //           context, '/home', (route) => false);
              //     },
              //     child: Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}
