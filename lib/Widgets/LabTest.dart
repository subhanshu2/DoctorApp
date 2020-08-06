import 'package:flutter/material.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
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
  List<Widget> tabsFun(BuildContext context) {
    final tabpages = <Widget>[
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
    ];
    return tabpages;
  }

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

  final tabs = <Tab>[
    Tab(
      text: 'Numeric Parameter',
    ),
    Tab(
      text: 'Radio Parameter',
    )
  ];

  @override
  Widget build(BuildContext context) {
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
                  child: TextField(
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
                    onSubmitted: (value) {},
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
                        onSubmitted: (value) {},
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
                        onSubmitted: (value) {},
                      ),
                    ),
                  ],
                ),
                // Text("Hello"),
                // ListView.builder(
                //   shrinkWrap: true,
                //   itemBuilder:(context, index){
                //     return Text('');
                //   },
                // ),
                TabBar(
                  controller: controller,
                  tabs: tabs,
                  labelColor: black,
                  isScrollable: true,
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      controller: controller,
                      children: tabsFun(context),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
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
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 100.0),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: purple,
                        child: Text('Add More'),
                        onPressed: () {})
                  ],
                )
              ],
            ))
      ],
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
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 45.0,
                  child: TextFormField(
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
                      labelText: widget.paraName,
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 45.0,
                  child: TextFormField(
                    decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        hintText: widget.val1,
                        labelText: widget.val1),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 45.0,
                  child: TextFormField(
                    decoration: new InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blue),
                      ),
                      hintText: widget.val2,
                      labelText: widget.val2,
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 45.0,
                  child: TextFormField(
                    decoration: new InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blue),
                      ),
                      hintText: widget.val3,
                      labelText: widget.val3,
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            )));
  }
}
