import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/MedicinesTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Models/DoctorLogin.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMedicine extends StatefulWidget {
  final String pId;
  final int docId;
  AddMedicine({Key key, this.pId, this.docId}) : super(key: key);

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  ClinicDoctor doc;
  getParameters() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String doctors = pref.getString('dresponse');
    DoctorLogin docUser = DoctorLogin.fromJson(json.decode(doctors));
    // for (var i in docUser.data.clinicDoctor) {
    //   if (i.doctorId == widget.docId) {
    //     setState(() {
    //       doc = i;
    //     });
    //   }
    // }

    setState(() {
      doc = docUser.data.clinicDoctor
          .where((element) => element.doctorId == widget.docId)
          .first;
      dose = doc.medicineDoses;
      unit = doc.medicineUnits;
      route = doc.medicineRoutes;
      frequency = doc.medicineFrequencies;
      directions = doc.medicineDirections;
      duration = doc.medicineDurations;
      category = doc.medicineCategories;
    });
  }

  addParameter(String parameter, String type) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String doctors = pref.getString('dresponse');
    DoctorLogin docUser = DoctorLogin.fromJson(json.decode(doctors));
    switch (type) {
      case 'dose':
        docUser.data.clinicDoctor
            .where((element) => element.doctorId == widget.docId)
            .first
            .medicineDoses
            .add(parameter);
        break;
      case 'unit':
        docUser.data.clinicDoctor
            .where((element) => element.doctorId == widget.docId)
            .first
            .medicineUnits
            .add(parameter);
        break;
      case 'route':
        docUser.data.clinicDoctor
            .where((element) => element.doctorId == widget.docId)
            .first
            .medicineRoutes
            .add(parameter);
        break;
      case 'frequency':
        docUser.data.clinicDoctor
            .where((element) => element.doctorId == widget.docId)
            .first
            .medicineFrequencies
            .add(parameter);
        break;
      case 'directions':
        docUser.data.clinicDoctor
            .where((element) => element.doctorId == widget.docId)
            .first
            .medicineDirections
            .add(parameter);
        break;
      case 'duration':
        docUser.data.clinicDoctor
            .where((element) => element.doctorId == widget.docId)
            .first
            .medicineDurations
            .add(parameter);
        break;
      default:
    }
    print('done');
    pref.remove('dresponse');
    pref.setString('dresponse', json.encode(docUser));
    getParameters();
  }

  @override
  void initState() {
    super.initState();
    getParameters();
  }

  List<String> dose = [];
  List<String> unit = [];
  List<String> category = [];
  List<String> route = [];
  List<String> frequency = [];
  List<String> directions = [];
  List<String> duration = [];

  TextEditingController _name = new TextEditingController();
  TextEditingController _composition = new TextEditingController();
  TextEditingController _drug = new TextEditingController();
  String _category;
  String _dose;
  String _unit;
  String _route;
  String _frequency;
  String _directions;
  String _duration;

  @override
  Widget build(BuildContext context) {
    final med = Provider.of<MedicinesDB>(context);

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
                  'Add Medication',
                  style: TextStyle(color: white),
                ),
                IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Form(
              child: ListView(
                children: [
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _name,
                      decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        labelText: 'Medicine Name',
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _composition,
                      decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        labelText: 'Salt Composition',
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _drug,
                      decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        labelText: 'Severe Interaction Drugs',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      items: category.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      hint: Text('Select Category'),
                      value: _category,
                      elevation: 5,
                      isExpanded: true,
                      onChanged: (val) {
                        setState(() {
                          _category = val;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Default Parameters",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          items: dose.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          hint: Text('Select Dose'),
                          value: _dose,
                          onChanged: (val) {
                            setState(() {
                              _dose = val;
                            });
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: () {
                              _addParameter('dose', context);
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          items: unit.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          hint: Text('Select Unit'),
                          value: _unit,
                          onChanged: (val) {
                            setState(() {
                              _unit = val;
                            });
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: () {
                              _addParameter('unit', context);
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          items: route.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          hint: Text('Select Route'),
                          value: _route,
                          onChanged: (val) {
                            setState(() {
                              _route = val;
                            });
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: () {
                              _addParameter('route', context);
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          items: frequency.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          hint: Text('Select Frequency'),
                          value: _frequency,
                          onChanged: (val) {
                            setState(() {
                              _frequency = val;
                            });
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: () {
                              _addParameter('frequency', context);
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          items: directions.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          hint: Text('Select Direction'),
                          value: _directions,
                          onChanged: (val) {
                            setState(() {
                              _directions = val;
                            });
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: () {
                              _addParameter('direction', context);
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          items: duration.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          hint: Text('Select Duration'),
                          value: _duration,
                          onChanged: (val) {
                            setState(() {
                              _duration = val;
                            });
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: () {
                              _addParameter('duration', context);
                            })
                      ],
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        print('hello');
                        Medicine medicine = new Medicine(
                            category: _category,
                            clinicDoctorId: widget.docId,
                            defaultDirection: _directions,
                            defaultDose: _dose,
                            defaultDuration: _duration,
                            defaultFrequency: _frequency,
                            defaultRoute: _route,
                            defaultUnit: _unit,
                            doctorId: widget.docId,
                            interactionDrugs: _drug.text,
                            isOnline: false,
                            salt: _composition.text,
                            title: _name.text);
                        med.insert(medicine);
                        Navigator.pop(context);
                      },
                      color: green,
                      child: Text("SAVE"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _addParameter(String type, BuildContext context) {
    TextEditingController _parameter = new TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Add $type'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Enter New $type'),
                controller: _parameter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  addParameter(_parameter.text, type);
                },
                child: Text('Save'),
                color: green,
                textColor: white,
              ),
            ),
          ],
        );
      },
    );
  }
}
