import 'package:flutter/material.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';

class MedicineSearch extends StatefulWidget {
  final String pId;
  final int docId;
  MedicineSearch({Key key, this.pId, this.docId}) : super(key: key);

  @override
  _MedicineSearchState createState() => _MedicineSearchState();
}

class _MedicineSearchState extends State<MedicineSearch> {
  String query='';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Search Medicine"),
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
                    // _buildTaskList(
                    //     context, query, database, patientsVisit, widget.pId),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: FloatingActionButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                        // return AddSymptoms(
                        //   docId: widget.docId,
                        // );
                      // },
                    // );
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
    );
  }
}