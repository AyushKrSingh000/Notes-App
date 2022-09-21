// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

String Name2 = '';

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setStringLt(Name2);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        return await Future.delayed(Duration.zero);
      },
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                // height: 200,
                height: 700,
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: TextFormField(
                  maxLines: 200,
                  initialValue: Name2,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(20))),
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
              ElevatedButton(
                  onPressed: () {
                    setStringLt(Name2);

                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  child: Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}
