import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String Name = '';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  void setStringLt(String desc) async {
    final SharedPreferences prefs = await _prefs;

    if (prefs.getStringList('data') == null) {
      // newData.clear();
      oldData.add(desc);

      prefs.setStringList('data', oldData);
    } else {
      oldData = prefs.getStringList('data') as List<String>;
      oldData.add(desc);

      prefs.setStringList('data', oldData);
    }
    currData = prefs.getStringList('data') as List<String>;

    setState(() {});
  }

  void setStringL() async {
    final SharedPreferences prefs = await _prefs;

    if (prefs.getStringList('date2') == null) {
      // newData.clear();
      oldData2.add(
          '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}');

      prefs.setStringList('date2', oldData2);
    } else {
      oldData2 = prefs.getStringList('date2') as List<String>;
      oldData2.add(
          '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}');

      prefs.setStringList('date2', oldData2);
    }

    currData2 = prefs.getStringList('date2') as List<String>;
    // print(currData2);

    setState(() {});
  }

  void setStringL2() async {
    final SharedPreferences prefs = await _prefs;

    if (prefs.getStringList('time') == null) {
      // newData.clear();
      oldData3.add(
          '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}');

      prefs.setStringList('time', oldData3);
    } else {
      oldData3 = prefs.getStringList('time') as List<String>;
      oldData3.add(
          '${DateTime.now().hour % 12}:${DateTime.now().minute < 10 ? '0' : ''}${DateTime.now().minute}${DateTime.now().hour / 12 < 1 ? ' AM' : ' PM'}');

      prefs.setStringList('time', oldData3);
    }

    currData3 = prefs.getStringList('time') as List<String>;
    print(currData3);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    // print(currData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Name == '') {
        } else {
          setStringLt(Name);
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
              SizedBox(
                height: 40,
              ),
              Container(
                // height: 200,
                height: 700,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextField(
                  maxLines: 200,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                      // prefixText: ,
                      hintText: 'Name,Age,etc..',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(20))),
                  onChanged: (value) {
                    setState(() {
                      if (value == null) {
                        Name = '';
                      } else {
                        Name = value;
                      }
                    });
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (Name == '') {
                    } else {
                      setStringLt(Name);
                      setStringL();

                      setStringL2();
                    }
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
