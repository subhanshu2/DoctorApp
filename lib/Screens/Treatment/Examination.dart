import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Models/addItemmodel.dart';


class Examination extends StatefulWidget {
  Examination({Key key}) : super(key: key);

  @override
  _ExaminationState createState() => _ExaminationState();
}

class _ExaminationState extends State<Examination> {
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
      text: 'Diagnosis',
    ),
    Tab(
      text: 'Medication',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: ExpansionTile(title: Text('Examination'), children: [
                    for (int i = 0; i < _selectedAddItemsDoctors.length; i++)
                      Container(
                        child: ListTile(
                          title: Text(_selectedAddItemsDoctors[i].name),
                        ),
                      ),
                  ]),
                ),
                IconButton(
                    icon: Icon(
                      Icons.local_hospital,
                      color: orange,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: AlertDialog(
                              scrollable: true,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(child: Text('Brief History')),
                                  InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: Icon(Icons.close))
                                ],
                              ),
                              actions: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FlutterTagging<AddItemsDoctor>(
                                          initialItems:
                                              _selectedAddItemsDoctors,
                                          textFieldConfiguration:
                                              TextFieldConfiguration(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              filled: true,
                                              fillColor:
                                                  Colors.green.withAlpha(30),
                                              hintText: 'Search Disease',
                                              labelText: 'Select Disease',
                                            ),
                                          ),
                                          findSuggestions: AddItemsDoctorService
                                              .getAddItemsDoctors,
                                          additionCallback: (value) {
                                            return AddItemsDoctor(
                                              name: value,
                                            );
                                          },
                                          onAdded: (addItemsDoctor) {
                                            // api calls here, triggered when add to tag button is pressed
                                            return AddItemsDoctor();
                                          },
                                          configureSuggestion: (lang) {
                                            return SuggestionConfiguration(
                                              title: Text(lang.name),
                                              additionWidget: Chip(
                                                avatar: IconButton(
                                                  icon: Icon(
                                                    Icons.add_circle,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _selectedAddItemsDoctors
                                                          .add(lang);
                                                    });
                                                  },
                                                ),
                                                label: Text('Add New Tag'),
                                                labelStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                          },
                                          configureChip: (lang) {
                                            return ChipConfiguration(
                                              label: Text(lang.name),
                                              backgroundColor: Colors.green,
                                              labelStyle: TextStyle(
                                                  color: Colors.white),
                                              deleteIconColor: Colors.white,
                                            );
                                          },
                                          onChanged: () {
                                            setState(() {
                                              _selectedValuesJson =
                                                  _selectedAddItemsDoctors
                                                      .map<String>(
                                                          (lang) => lang.name)
                                                      .toString();
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Expanded(
                                        child: SyntaxView(
                                          code: _selectedValuesJson,
                                          syntax: Syntax.JAVASCRIPT,
                                          withLinesCount: false,
                                          syntaxTheme: SyntaxTheme.standard(),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: FloatingActionButton(
                                            tooltip: 'Add Test',
                                            elevation: 10.0,
                                            child: Icon(Icons.add,
                                                size: 40.0, color: white),
                                            onPressed: () => showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    // return SingleChildScrollView(
                                                    //     child:
                                                    //         ChangeNotifierProvider(
                                                    //   create: (context) =>
                                                    //       TestProvider(),
                                                    //   child: LabTest(),
                                                    // ));
                                                  },
                                                )),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
