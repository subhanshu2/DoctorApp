import 'package:flutter/material.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';

class GetTimings extends StatefulWidget {
  @override
  _GetTimingsState createState() => _GetTimingsState();
}

class _GetTimingsState extends State<GetTimings> {
  String day = '0';
  String month = '0';
  String year = '0';
  String _radioValue;
  String choice;
  List<String> days = [];
  List<String> months = [];
  List<String> years = [];

  void addNumbers() {
    for (int i = 0; i <= 31; i++) {
      days.add(i.toString());
    }
    for (int i = 0; i <= 11; i++) {
      months.add(i.toString());
    }

    for (int i = 0; i <= 22; i++) {
      years.add(i.toString());
    }
    years.add('22+');
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'Since':
          choice = value;
          break;
        case 'Cured':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  @override
  void initState() {
    super.initState();
    addNumbers();
  }

  @override
  Widget build(BuildContext context) {
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
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Since'),
                            Radio(
                                activeColor: orangep,
                                value: 'Since',
                                groupValue: _radioValue,
                                onChanged: radioButtonChanges),
                          ],
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text('Cured'),
                            Radio(
                                activeColor: orangep,
                                value: 'Cured',
                                groupValue: _radioValue,
                                onChanged: radioButtonChanges),
                          ],
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Days'),
                          DropdownButton<String>(
                            value: day,
                            hint: Text('Slect days'),
                            // icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: black),
                            underline: Container(
                              height: 2,
                              color: grey,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                day = newValue;
                              });
                            },
                            items: days
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Months'),
                          DropdownButton<String>(
                            value: month,
                            hint: Text('Slect months'),
                            // icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: black),
                            underline: Container(
                              height: 2,
                              color: grey,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                month = newValue;
                              });
                            },
                            items: months
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Years'),
                          DropdownButton<String>(
                            value: year,
                            hint: Text('Slect years'),
                            // icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: black),
                            underline: Container(
                              height: 2,
                              color: grey,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                year = newValue;
                              });
                            },
                            items: years
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ]),
                    RaisedButton(
                      color: pcolor,
                      child: Text('Save'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
