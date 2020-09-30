import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/Network/Requesthttp.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../Helpers/AppConfig/colors.dart';

class SlotBooking extends StatefulWidget {
  final int tokenno;
  final DateTime time;
  final Token token;
  final Function count;
  final Function changeColorAppointment;
  final TokenDB database;
  final PatientsDB patientDatabase;
  const SlotBooking(
      {Key key,
      this.tokenno,
      this.time,
      this.token,
      this.count,
      this.changeColorAppointment,
      this.database,
      this.patientDatabase});
  @override
  _SlotBookingState createState() => _SlotBookingState();
}

class _SlotBookingState extends State<SlotBooking> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _radioValue;
  String _radioValue2;
  String _radioValue3;
  String _radiovalue4;
  String choice;
  String choice2;
  String choice3;
  String choice4;
  String _name;
  String _age;
  String _fees;
  String _address;
  String _mobileno;

  bool result = false;
  String patientId = '';
  String response = 'NIL';

  Patient patient;
  var responsePatient;

  TextEditingController ctrl1;
  TextEditingController ctrl2;
  TextEditingController ctrl3;
  TextEditingController ctrl4;

  // checkConnection() async {
  //   bool res = await DataConnectionChecker().hasConnection;
  //   print(res);
  //   setState(() {
  //     result = res;
  //   });
  // }

  var listener = DataConnectionChecker().onStatusChange.listen((status) {
    switch (status) {
      case DataConnectionStatus.connected:
        print('Data connection is available.');
        break;
      case DataConnectionStatus.disconnected:
        print('You are disconnected from the internet.');
        break;
    }
  });
  @override
  void initState() {
    super.initState();
    // checkConnection();
    ctrl1 = TextEditingController();
    ctrl2 = TextEditingController();
    ctrl3 = TextEditingController();
    ctrl4 = TextEditingController();
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'general':
          choice = value;
          break;
        case 'emergency':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  void radioButtonChanges2(String value) {
    setState(() {
      _radioValue2 = value;
      switch (value) {
        case 'new visit':
          choice2 = value;
          break;
        case 'follow up':
          choice2 = value;
          break;
        default:
          choice2 = null;
      }
      debugPrint(choice2); //Debug the choice in console
    });
  }

  void radioButtonChanges3(String value) {
    setState(() {
      _radioValue3 = value;
      switch (value) {
        case 'walk in':
          choice3 = value;
          break;
        case 'on call':
          choice3 = value;
          break;
        default:
          choice3 = null;
      }
      debugPrint(choice3); //Debug the choice in console
    });
  }

  void radioButtonChanges4(String value) {
    setState(() {
      _radiovalue4 = value;
      switch (value) {
        case 'male':
          choice4 = value;
          break;
        case 'female':
          choice4 = value;
          break;
        default:
          choice4 = null;
      }
      debugPrint(choice4); //Debug the choice in console
    });
  }

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    // final database = Provider.of<TokenDB>(context);
    print(listener);
    return SimpleDialog(
        elevation: 20,
        titlePadding: EdgeInsets.zero,
        title: Container(
          color: orangep,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Patient Details',
                  style: TextStyle(color: white),
                ),
                IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () => Navigator.pop(context))
              ],
            ),
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              title: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * .75,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'search existing record',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search)),
                  onChanged: (val) async {
                    setState(() {
                      patientId = val;
                    });
                    List<Patient> doc =
                        await widget.patientDatabase.checkPatient(patientId);
                    // print(doc.toString());
                    if (doc.isEmpty) {
                      ctrl1.clear();
                      ctrl2.clear();
                      ctrl3.clear();
                      ctrl4.clear();
                      // _age = doc.age.toString();
                      // _address = doc.address;
                      // _mobileno = doc.mobileNo.toString();
                      _radiovalue4 = '';
                    } else {
                      setState(() {
                        // _name = doc.name;
                        ctrl1.text = doc[0].name;
                        ctrl2.text = doc[0].age.toString();
                        ctrl3.text = doc[0].address;
                        ctrl4.text = doc[0].mobileNo.toString();
                        // _age = doc.age.toString();
                        // _address = doc.address;
                        // _mobileno = doc.mobileNo.toString();
                        _radiovalue4 =
                            doc[0].gender == Gender.Male ? 'male' : 'female';
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          Form(
              key: _formKey,
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: TextFormField(
                        controller: ctrl1,
                        autofocus: true,
                        // initialValue: _name,
                        decoration: InputDecoration(
                          labelText: 'Patients name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onSaved: (String val) {
                          _name = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2, 8, 2),
                      child: TextFormField(
                        controller: ctrl2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onSaved: (String val) {
                          _age = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2, 8, 2),
                      child: TextFormField(
                        controller: ctrl3,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onSaved: (String val) {
                          _address = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2, 8, 2),
                      child: TextFormField(
                        controller: ctrl4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onSaved: (String val) {
                          _mobileno = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          if (value.length != 10) {
                            return 'enter a 10 digit number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 2, 8, 2),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              initialValue: widget.token.fees.toString(),
                              decoration: InputDecoration(
                                labelText: 'Fees',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onSaved: (String val) {
                                _fees = val;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Cannot be empty';
                                }
                                if (int.parse(value) < 50) {
                                  return 'Cannot be less than 50';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Gender:'),
                        SizedBox(
                          width: 38,
                        ),
                        Radio(
                          activeColor: orangep,
                          value: 'male',
                          groupValue: _radiovalue4,
                          onChanged: radioButtonChanges4,
                        ),
                        Text(
                          "Male",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                          activeColor: orangep,
                          value: 'female',
                          groupValue: _radiovalue4,
                          onChanged: radioButtonChanges4,
                        ),
                        Text(
                          "Female",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Appointment \nType:'),
                        Radio(
                          activeColor: orangep,
                          value: 'general',
                          groupValue: _radioValue,
                          onChanged: radioButtonChanges,
                        ),
                        Text(
                          "general",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Radio(
                          activeColor: orangep,
                          value: 'emergency',
                          groupValue: _radioValue,
                          onChanged: radioButtonChanges,
                        ),
                        Text(
                          "emergency",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Visit Type:'),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                          activeColor: orangep,
                          value: 'new visit',
                          groupValue: _radioValue2,
                          onChanged: radioButtonChanges2,
                        ),
                        Text(
                          "new visit",
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        Radio(
                          activeColor: orangep,
                          value: 'follow up',
                          groupValue: _radioValue2,
                          onChanged: radioButtonChanges2,
                        ),
                        Text(
                          "follow \nup",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Booked Type:'),
                        Radio(
                          activeColor: orangep,
                          value: 'walk in',
                          groupValue: _radioValue3,
                          onChanged: radioButtonChanges3,
                        ),
                        Text(
                          "walk in",
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Radio(
                          activeColor: orangep,
                          value: 'on call',
                          groupValue: _radioValue3,
                          onChanged: radioButtonChanges3,
                        ),
                        Text(
                          "on call",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Token no \n& Time:'),
                        Text('Token no: ${widget.tokenno.toString()}'),
                        Text(
                            'Time: ${DateFormat.jm().format(widget.time).toString()}'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RoundedLoadingButton(
                          height: 45,
                          width: 120,
                          color: pcolor,
                          child: Text(
                            'Book',
                            style: TextStyle(color: white),
                          ),
                          controller: _btnController,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              // if (result == true) {
                              //   response = await bookToken(
                              //     _name,
                              //     _age,
                              //     _mobileno,
                              //     _address,
                              //     _radioValue2,
                              //     _radioValue,
                              //     widget.tokenno,
                              //     widget.time,
                              //     widget.token.tokentime,
                              //     _radioValue3,
                              //     widget.token.doctorid,
                              //     _radiovalue4,
                              //   );
                              // }
                              print("GUID" + response);
                              var pat = Patient(
                                  mobileNo: int.parse(_mobileno),
                                  name: _name,
                                  gender: _radiovalue4 == 'male'
                                      ? Gender.Male
                                      : Gender.Female,
                                  age: int.parse(_age),
                                  address: _address);
                              responsePatient = await widget.patientDatabase
                                  .createPatient2(pat);
                              print("Patient reponse" +
                                  responsePatient.toString());
                              widget.database.updateData(
                                  widget.token.copyWith(
                                      name: _name,
                                      mobileno: int.parse(_mobileno),
                                      address: _address,
                                      age: int.parse(_age),
                                      appointmenttype: _radioValue,
                                      visittype: _radioValue2,
                                      bookedtype: _radioValue3,
                                      booked: true,
                                      gender: _radiovalue4,
                                      guid: responsePatient),
                                  response.toString());

                              // setState(() {
                              //   // widget.count(widget.database);
                              // });

                              _btnController.success();
                              Timer(Duration(seconds: 1),
                                  () => Navigator.pop(context));
                            } else {
                              _btnController.reset();
                            }
                          },
                        ),
                        RoundedLoadingButton(
                          height: 45,
                          width: 120,
                          color: pcolor,
                          controller: _btnController,
                          child: Text(
                            'Book & Print',
                            style: TextStyle(color: white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              // if (result == true) {
                              //   response = await bookToken(
                              //     _name,
                              //     _age,
                              //     _mobileno,
                              //     _address,
                              //     _radioValue2,
                              //     _radioValue,
                              //     widget.tokenno,
                              //     widget.time,
                              //     widget.token.tokentime,
                              //     _radioValue3,
                              //     widget.token.doctorid,
                              //     _radiovalue4,
                              //   );
                              // }
                              print("GUID" + response);
                              var pat = Patient(
                                  mobileNo: int.parse(_mobileno),
                                  name: _name,
                                  gender: _radiovalue4 == 'male'
                                      ? Gender.Male
                                      : Gender.Female,
                                  age: int.parse(_age),
                                  address: _address);
                              responsePatient = await widget.patientDatabase
                                  .createPatient2(pat);
                              print("Patient reponse" +
                                  responsePatient.toString());
                              widget.database.updateData(
                                  widget.token.copyWith(
                                      name: _name,
                                      mobileno: int.parse(_mobileno),
                                      address: _address,
                                      age: int.parse(_age),
                                      appointmenttype: _radioValue,
                                      visittype: _radioValue2,
                                      bookedtype: _radioValue3,
                                      booked: true,
                                      gender: _radiovalue4,
                                      guid: responsePatient),
                                  response.toString());
                              _btnController.success();
                              Timer(Duration(seconds: 1),
                                  () => Navigator.pop(context));
                            } else {
                              _btnController.reset();
                            }
                          },
                        )
                      ],
                    )
                  ])))
        ]);
  }
}
