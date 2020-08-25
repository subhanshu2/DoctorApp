import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/ExaminationTable.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:provider/provider.dart';

import 'LabTest.dart';

class ExaminationSearchBar extends StatefulWidget {
  final String pId;
  final int docId;
  ExaminationSearchBar({Key key, this.pId, this.docId}) : super(key: key);

  @override
  _ExaminationSearchBarState createState() => _ExaminationSearchBarState();
}

class _ExaminationSearchBarState extends State<ExaminationSearchBar> {
  String query = '';

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<ExaminationsDB>(context);
    final patientsVisit = Provider.of<PatientsVisitDB>(context);

    return SingleChildScrollView(
      child: AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(child: Text('Examination')),
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
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: LabTest(),
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

  StreamBuilder<List<Examination>> _buildTaskList(BuildContext context,
      String query, ExaminationsDB database, PatientsVisitDB pv, String pId) {
    return StreamBuilder(
      stream: database.watchAllTasks(query),
      builder: (context, AsyncSnapshot<List<Examination>> snapshot) {
        final tasks = snapshot.data ?? List();
        print(tasks.length);
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
}
