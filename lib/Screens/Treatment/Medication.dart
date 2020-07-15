import 'package:flutter/material.dart';
import 'package:getcure_doctor/Models/addItemmodel.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
class Medication extends StatefulWidget {
  Medication({Key key}) : super(key: key);

  @override
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  String _selectedValuesJson = 'Nothing to show';
  List<AddItemsDoctor> _selectedAddItemsDoctors;
  @override
  void initState() {
    _selectedAddItemsDoctors = [];
    super.initState();
  }

  @override
  void dispose() {
    _selectedAddItemsDoctors.clear();
    super.dispose();
  }

  List<Widget> tabsFun(BuildContext context) {
    final tabpages = <Widget>[
      Center(
          child: Icon(
        Icons.gavel,
        size: 64,
        color: orange,
      )),
      Center(
          child: Icon(
        Icons.edit,
        size: 64,
        color: orange,
      )),
    ];
    return tabpages;
  }

  final tabs = <Tab>[
    Tab(
      text: 'Medication',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
                      child: Container(
              padding: EdgeInsets.all(8),
              height: 160,
              width: double.maxFinite,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(child: Text('Asthama (2 mobths)')),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Tab xyz 500mg'),
                              Text('1+!+!'),
                              Text('after food'),
                              Text('7 days')
                            ],
                          ),
                          Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Cap abc 600mg'),
                              Text('1+!'),
                              Text('before food'),
                              Text('17 days')
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children:<Widget>[
                                    Icon(Icons.person),
                                    Text('234')
                                ]),
                                Row(
                                  children:<Widget>[
                                    Icon(Icons.timer),
                                    Text('234')
                                ]),
                                Row(
                                  children:<Widget>[
                                    Icon(Icons.view_list),
                                    Text('234')
                                ]),
                                Row(
                                  children:<Widget>[
                                    Icon(Icons.lock_outline),
                                    Text('234')
                                ]),
                                Row(
                                  children:<Widget>[
                                    IconButton(
                                      icon: Icon(Icons.add_box),
                                      onPressed: ()
                                      {

                                      },
                                    ),
                                ])
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
