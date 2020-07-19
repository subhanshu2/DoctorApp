import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/SymptomsTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Models/PatientsVisitTableModels.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String query = '';
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
                        // onChanged: (val) {
                        //   setState(() {
                        //     query = val;
                        //   });
                        // },
                        onSubmitted: (val) {
                          setState(() {
                            query = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              _buildTaskList(context, query, database),
              Positioned(
                bottom: 0,
                right: 0,
                child: FloatingActionButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: AlertDialog(
                            titlePadding: EdgeInsets.zero,
                            title: Container(
                              alignment: Alignment.center,
                              color: orangep,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ListTile(
                                        title: Container(
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .75,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: 'Enter Disease Name',
                                              border: OutlineInputBorder(),
                                              // suffixIcon: Icon(Icons.search)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                    ),
                                    Text('Visible in Brief History for'),
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                  activeColor: orangep,
                                                  value: '1month',
                                                  groupValue: _radioValue,
                                                  onChanged:
                                                      radioButtonChanges),
                                              Text('1 Month'),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                  activeColor: orangep,
                                                  value: '3month',
                                                  groupValue: _radioValue,
                                                  onChanged:
                                                      radioButtonChanges),
                                              Text('3 Months'),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                  activeColor: orangep,
                                                  value: '6month',
                                                  groupValue: _radioValue,
                                                  onChanged:
                                                      radioButtonChanges),
                                              Text('6 Months'),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                  activeColor: orangep,
                                                  value: '1year',
                                                  groupValue: _radioValue,
                                                  onChanged:
                                                      radioButtonChanges),
                                              Text('1 Year'),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                  activeColor: orangep,
                                                  value: '5year',
                                                  groupValue: _radioValue,
                                                  onChanged:
                                                      radioButtonChanges),
                                              Text('5 Years'),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                  activeColor: orangep,
                                                  value: 'Always',
                                                  groupValue: _radioValue,
                                                  onChanged:
                                                      radioButtonChanges),
                                              Text('Always'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
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
     SymptomsDB database) {
  // final database = Provider.of<SymptomsDB>(context);
  return StreamBuilder(
    stream: database.watchAllTasks(query),
    builder: (context, AsyncSnapshot<List<Symptom>> snapshot) {
      print(query);
      final tasks = snapshot.data ?? List();
      return Container(
        height: 200,
        width: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tasks.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final itemTask = tasks[index];
            return;
          },
        ),
      );
    },
  );
}
