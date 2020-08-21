import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/ExaminationTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/provider/ExaminationProvider.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

List<TestNames> testParams = [];
TestNames obj;

class LabTest extends StatefulWidget {
  @override
  _LabTestState createState() => _LabTestState();
}

class _LabTestState extends State<LabTest> with SingleTickerProviderStateMixin {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TextEditingController _title = new TextEditingController();
  TextEditingController _sample = new TextEditingController();
  TextEditingController _method = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ExaminationProvider>(
      builder: (context, test, child) {
        return AlertDialog(
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
                    'Add Lab Test',
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
                  children: <Widget>[
                    Container(
                      height: 45.0,
                      child: TextFormField(
                        decoration: new InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: orange),
                            ),
                            hintText: 'Sample Test',
                            labelText: 'Enter Sample Test Name',
                            labelStyle: TextStyle(color: orange)),
                        controller: _title,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          height: 55.0,
                          child: TextField(
                            decoration: new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: orange),
                                ),
                                hintText: 'Sample',
                                labelText: 'Sample',
                                labelStyle: TextStyle(color: orange)),
                            controller: _sample,
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 55.0,
                          child: TextField(
                            decoration: new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: orange),
                                ),
                                hintText: 'Method',
                                labelText: 'Method',
                                labelStyle: TextStyle(color: orange)),
                            controller: _method,
                          ),
                        ),
                      ],
                    ),

                    TabBar(
                      controller: controller,
                      tabs: <Tab>[
                        Tab(
                          text: 'Numeric Parameter',
                        ),
                        Tab(
                          text: 'Radio Parameter',
                        )
                      ],
                      labelColor: black,
                      isScrollable: true,
                    ),
                    Expanded(
                      child: Container(
                        child: TabBarView(
                          controller: controller,
                          children: <Widget>[
                            NumericParameter(
                              paraName: 'Parameter Name',
                              val1: 'Low Biological Ref Interval',
                              val2: 'High Biological Ref Interval',
                              val3: 'Unit',
                            ),
                            NumericParameter(
                              paraName: 'RParameter Name',
                              val1: 'Result Type I',
                              val2: 'Result Type II',
                              val3: 'Biological Reference Interval',
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: <Widget>[
                    RoundedLoadingButton(
                      width: 80.0,
                      height: 40.0,
                      controller: _btnController,
                      child: Text(
                        'Submit',
                        style: TextStyle(color: white),
                      ),
                      color: blue,
                      onPressed: () {
                        print(test.parametersList.length);
                        _btnController.reset();
                        // if (testProvider.obj.numParaName != null) {
                        //   _btnController.success();
                        //   setState(() {
                        //     // testProvider.addTest();
                        //   });
                        //   print(obj.sampleTestName);
                        //   print(obj.numParaName);
                        //   print(obj.radioParaName);

                        //   // changeScreen(context, PatientInfo());
                        // } else {
                        //   _btnController.reset();
                        // }
                      },
                    ),
                    //     RaisedButton(
                    //         shape: RoundedRectangleBorder(
                    //           side: BorderSide(width: 100.0),
                    //           borderRadius: BorderRadius.circular(18.0),
                    //         ),
                    //         color: purple,
                    //         child: Text('Add More'),
                    //         onPressed: () {})
                    //   ],
                    // )
                  ],
                ))
          ],
        );
      },
    );
  }
}

class TestNames {
  String sampleTestName;
  String sample;
  String method;
  String numParaName;
  String numLowInterval;
  String numHighInterval;
  String numUnit;
  String radioParaName;
  String result1;
  String result2;
  String radioBioInterval;

  TestNames(
      this.sampleTestName,
      this.sample,
      this.method,
      this.numParaName,
      this.numLowInterval,
      this.numHighInterval,
      this.numUnit,
      this.radioParaName,
      this.result1,
      this.result2,
      this.radioBioInterval);
}

class NumericParameter extends StatefulWidget {
  final String paraName;
  final String val1;
  final String val2;
  final String val3;

  const NumericParameter(
      {Key key, this.paraName, this.val1, this.val2, this.val3})
      : super(key: key);

  @override
  _NumericParameterState createState() => _NumericParameterState();
}

class _NumericParameterState extends State<NumericParameter> {
  TextEditingController _pname = new TextEditingController();
  TextEditingController _lbr = new TextEditingController();
  TextEditingController _hbr = new TextEditingController();
  TextEditingController _unit = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<ExaminationProvider>(builder: (context, test, child) {
      return Form(
          key: _formKey,
          child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 45.0,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                          // borderRadius: BorderRadius.all(Radius.circular(40.0))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                          // borderRadius: BorderRadius.all(Radius.circular(40.0))
                        ),
                        hintText: widget.paraName,
                        // labelText: widget.paraName,
                      ),
                      controller: _pname,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 45.0,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blue),
                          ),
                          hintText: widget.val1,
                          // labelText: widget.val1
                          ),
                      controller: _lbr,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 45.0,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        hintText: widget.val2,
                        // labelText: widget.val2,
                      ),
                      controller: _hbr,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 45.0,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        hintText: widget.val3,
                        // labelText: widget.val3,
                      ),
                      controller: _unit,
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: <Widget>[
                  // RoundedLoadingButton(
                  //   width: 80.0,
                  //   height: 40.0,
                  //   controller: _btnController,
                  //   child: Text(
                  //     'Submit',
                  //     style: TextStyle(color: white),
                  //   ),
                  //   color: blue,
                  //   onPressed: () {
                  //     // if (testProvider.obj.numParaName != null) {
                  //     //   _btnController.success();
                  //     //   setState(() {
                  //     //     // testProvider.addTest();
                  //     //   });
                  //     //   print(obj.sampleTestName);
                  //     //   print(obj.numParaName);
                  //     //   print(obj.radioParaName);

                  //     //   // changeScreen(context, PatientInfo());
                  //     // } else {
                  //     //   _btnController.reset();
                  //     // }
                  //   },
                  // ),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 50.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: purple,
                      child: Text('Add More'),
                      onPressed: () {
                        // _formKey.currentState.save();
                        if (_formKey.currentState.validate()) {
                          test.addParameter(new ParameterData(
                            title: _pname.text,
                            references: [
                              int.parse(_lbr.text),
                              int.parse(_hbr.text)
                            ],
                            unit: _unit.text,
                          ));

                          print(_pname.text);
                          _lbr.clear();
                          _pname.clear();
                          _hbr.clear();
                          _unit.clear();
                        }
                      })
                  //   ],
                  // )
                ],
              )));
    });
  }
}
