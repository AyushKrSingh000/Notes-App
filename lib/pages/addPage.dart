// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/ColoredBosed.dart';
import 'homepage.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  Color col = Colors.white;
  String name = '';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void colorD() async {
    final SharedPreferences prefs = await _prefs;
    List<String> mList = prefs.getStringList('color') as List<String>;
    colorData = mList.map((i) => int.parse(i)).toList();
    setState(() {});
  }

  void SetColor() async {
    final SharedPreferences prefs = await _prefs;
    currDa = prefs.getStringList('color') as List<String>;
    currDa.add('0');
    prefs.setStringList('color', currDa);
    setState(() {});
    colorData = currDa.map((i) => int.parse(i)).toList();
    setState(() {});
  }

  void removeColor() async {
    final SharedPreferences prefs = await _prefs;
    currDa = prefs.getStringList('color') as List<String>;
    currDa.removeLast();
    prefs.setStringList('color', currDa);
    setState(() {});
    colorData = currDa.map((i) => int.parse(i)).toList();
    setState(() {});
  }

  void setStrings() async {
    final SharedPreferences prefs = await _prefs;
    currData = prefs.getStringList('data') as List<String>;
    currData.add('');
    prefs.setStringList('data', currData);
    currData = prefs.getStringList('data') as List<String>;
    setState(() {});
    currData2 = prefs.getStringList('date2') as List<String>;
    currData2.add('');
    prefs.setStringList('date2', currData2);
    currData2 = prefs.getStringList('date2') as List<String>;
    setState(() {});
    currData3 = prefs.getStringList('time') as List<String>;
    currData3.add('');
    prefs.setStringList('time', currData3);
    currData3 = prefs.getStringList('time') as List<String>;
    setState(() {});
  }

  void removeStrings() async {
    final SharedPreferences prefs = await _prefs;
    currData = prefs.getStringList('data') as List<String>;
    currData.removeLast();
    prefs.setStringList('data', currData);
    currData = prefs.getStringList('data') as List<String>;
    setState(() {});
    currData2 = prefs.getStringList('date2') as List<String>;
    currData2.removeLast();
    prefs.setStringList('date2', currData2);
    currData2 = prefs.getStringList('date2') as List<String>;
    setState(() {});
    currData3 = prefs.getStringList('time') as List<String>;
    currData3.removeLast();
    prefs.setStringList('time', currData3);
    currData3 = prefs.getStringList('time') as List<String>;
    setState(() {});
  }

  void SetColor2(String de) async {
    if (de == '1') {
      col = Colors.amber[100] as Color;
    }
    if (de == '2') {
      col = Colors.lightGreen[100] as Color;
    }
    if (de == '3') {
      col = Colors.lightBlue[100] as Color;
    }
    if (de == '4') {
      col = Colors.orange[100] as Color;
    }
    if (de == '5') {
      col = Colors.redAccent[100] as Color;
    }
    final SharedPreferences prefs = await _prefs;
    currDa = prefs.getStringList('color') as List<String>;
    currDa[currDa.length - 1] = de;
    prefs.setStringList('color', currDa);
    setState(() {});
    colorData = currDa.map((i) => int.parse(i)).toList();
    setState(() {});
  }

  void setStringLt(String desc) async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getStringList('data') == null) {
      oldData.add(desc);
      prefs.setStringList('data', oldData);
    } else {
      oldData = prefs.getStringList('data') as List<String>;
      oldData[oldData.length - 1] = desc;
      prefs.setStringList('data', oldData);
    }
    currData = prefs.getStringList('data') as List<String>;

    setState(() {});
  }

  void setStringL() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getStringList('date2') == null) {
      oldData2.add(
          '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}');
      prefs.setStringList('date2', oldData2);
    } else {
      oldData2 = prefs.getStringList('date2') as List<String>;
      oldData2[oldData2.length - 1] =
          '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
      prefs.setStringList('date2', oldData2);
    }
    currData2 = prefs.getStringList('date2') as List<String>;
    setState(() {});
  }

  void setStringL2() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getStringList('time') == null) {
      oldData3.add(
          '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}');
      prefs.setStringList('time', oldData3);
    } else {
      oldData3 = prefs.getStringList('time') as List<String>;
      oldData3[oldData3.length - 1] =
          '${DateTime.now().hour % 12}:${DateTime.now().minute < 10 ? '0' : ''}${DateTime.now().minute}${DateTime.now().hour / 12 < 1 ? ' AM' : ' PM'}';
      prefs.setStringList('time', oldData3);
    }
    currData3 = prefs.getStringList('time') as List<String>;
    setState(() {});
  }

  @override
  void initState() {
    SetColor();
    setStrings();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (name == '') {
          removeColor();
          removeStrings();
        } else {
          setStringLt(name);
          setStringL();
          setStringL2();
        }
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        return await Future.delayed(Duration.zero);
      },
      child: Material(
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
                        SetColor2('1');
                      },
                      child: ColoredBox2(color: Colors.amber[100] as Color)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        SetColor2('2');
                      },
                      child:
                          ColoredBox2(color: Colors.lightGreen[100] as Color)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        SetColor2('3');
                      },
                      child:
                          ColoredBox2(color: Colors.lightBlue[100] as Color)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        SetColor2('4');
                      },
                      child: ColoredBox2(color: Colors.orange[100] as Color)),
                  const SizedBox(width: 20),
                  InkWell(
                      onTap: () {
                        SetColor2('5');
                      },
                      child:
                          ColoredBox2(color: Colors.redAccent[100] as Color)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                // height: 200,
                height: 700,
                width: 380,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  color: col,
                ),
                child: TextField(
                  maxLines: 200,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    // prefixText: ,
                    hintText: 'Name,Age,etc..',
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value == '') {
                        name = '';
                      } else {
                        name = value;
                        setStringLt(name);
                        setStringL2();
                        setStringL();
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
