import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/SymptomsTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Models/PatientsVisitTableModels.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  final String pId;
  final int docId;
  SearchBar({Key key, this.pId, this.docId}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String query = '';

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<SymptomsDB>(context);
    final patientsVisit = Provider.of<PatientsVisitDB>(context);

    return SingleChildScrollView(
      child: AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(child: Text('Brief History')),
            InkWell(
                onTap: () => Navigator.pop(context), child: Icon(Icons.close))
          ],
        ),
        actions: <Widget>[
          Stack(
            // fit: StackFit.expand,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.green[50],
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.green[100],
                            labelText: 'search',
                            labelStyle: TextStyle(color: blue),
                            border: InputBorder.none),
                        onChanged: (val) {
                          setState(() {
                            query = val;
                          });
                        },
                        // onSubmitted: (val) {
                        //   setState(() {
                        //     query = val;
                        //   });
                        // },
                      ),
                    ),
                    _buildTaskList(
                        context, query, database, patientsVisit, widget.pId),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddSymptoms(
                          docId: widget.docId,
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.add,
                    color: white,
                    size: 40,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

StreamBuilder<List<Symptom>> _buildTaskList(BuildContext context, String query,
    SymptomsDB database, PatientsVisitDB pv, String pId) {
  return StreamBuilder(
    stream: database.watchAllTasks(query),
    builder: (context, AsyncSnapshot<List<Symptom>> snapshot) {
      print(query);
      final tasks = snapshot.data ?? List();
      return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.separated(
          separatorBuilder: (_, index) {
            return Divider();
          },
          scrollDirection: Axis.vertical,
          itemCount: tasks.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final itemTask = tasks[index];
            return GestureDetector(
              onTap: () async {
                List<BriefHistoryData> bhd = [
                  BriefHistoryData(
                      date: DateTime.now().toString(),
                      title: itemTask.title,
                      visibleTill: itemTask.visibilityPeriod.toString())
                ];
                BriefHistorygenerated bh = BriefHistorygenerated(data: bhd);
                var p = await pv.checkPatient(pId);

                pv.updateBriefHistory(p[0], bh);
                Navigator.pop(context);
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                leading: Text(itemTask.title),
              ),
            );
          },
        ),
      );
    },
  );
}

class AddSymptoms extends StatefulWidget {
  final int docId;
  AddSymptoms({Key key, this.docId}) : super(key: key);

  @override
  _AddSymptomsState createState() => _AddSymptomsState();
}

class _AddSymptomsState extends State<AddSymptoms> {
  String diseaseName;
  String _radioValue;
  String choice;

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case '1month':
          choice = value;
          break;
        case '3month':
          choice = value;
          break;
        case '6month':
          choice = value;
          break;
        case '1year':
          choice = value;
          break;
        case '5year':
          choice = value;
          break;
        case 'Always':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<SymptomsDB>(context);

    return SingleChildScrollView(
      child: AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          alignment: Alignment.center,
          color: orangep,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Add Disease',
                  style: TextStyle(color: white),
                ),
                IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () => Navigator.pop(context))
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * .75,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter Disease Name',
                      border: OutlineInputBorder(),

                      // suffixIcon: Icon(Icons.search)
                    ),
                    onChanged: (val) {
                      setState(() {
                        diseaseName = val;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                ),
                Text('Visible in Brief History for'),
                Row(
                  children: <Widget>[
                    Radio(
                        activeColor: orangep,
                        value: '1month',
                        groupValue: _radioValue,
                        onChanged: radioButtonChanges),
                    Text('1 Month'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                        activeColor: orangep,
                        value: '3month',
                        groupValue: _radioValue,
                        onChanged: radioButtonChanges),
                    Text('3 Months'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                        activeColor: orangep,
                        value: '6month',
                        groupValue: _radioValue,
                        onChanged: radioButtonChanges),
                    Text('6 Months'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                        activeColor: orangep,
                        value: '1year',
                        groupValue: _radioValue,
                        onChanged: radioButtonChanges),
                    Text('1 Year'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                        activeColor: orangep,
                        value: '5year',
                        groupValue: _radioValue,
                        onChanged: radioButtonChanges),
                    Text('5 Years'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                        activeColor: orangep,
                        value: 'Always',
                        groupValue: _radioValue,
                        onChanged: radioButtonChanges),
                    Text('Always'),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: RaisedButton(
                color: pcolor,
                child: Text(
                  'Add',
                  style: TextStyle(color: white),
                ),
                onPressed: () {
                  VisibilityPeriod period;
                  setState(() {
                    if (_radioValue == '1month') {
                      period = VisibilityPeriod.OneMonth;
                    } else if (_radioValue == '3month') {
                      period = VisibilityPeriod.ThreeMonth;
                    } else if (_radioValue == '6month') {
                      period = VisibilityPeriod.SixMonth;
                    } else if (_radioValue == '1year') {
                      period = VisibilityPeriod.OneYear;
                    } else if (_radioValue == '5year') {
                      period = VisibilityPeriod.FiveYear;
                    } else {
                      period = VisibilityPeriod.Always;
                    }
                  });
                  database.addBrief(diseaseName, period, widget.docId);
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
