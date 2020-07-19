import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/SymptomsTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String query = '';

  @override
  Widget build(BuildContext context) {
  final database = Provider.of<SymptomsDB>(context);
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
                      ),
                    ),
                    // StreamBuilder(
                    //   stream: database.watchAllTasks(query),
                    //   builder: (context, AsyncSnapshot<List<Symptom>> snapshot) {
                    //     final tasks = snapshot.data ?? List();
                    //     return ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemCount: tasks.length,
                    //       itemBuilder: (_, index) {
                    //         final itemTask = tasks[index];
                    //       return;
                    //       },
                    //     );
                    //   },
                    // )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: FloatingActionButton(
                  onPressed: () {
                    print('object');
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
