import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';

class GeneralDetails extends StatefulWidget {
  final Token token;
  final PatientsVisitDB patientVisit;
  GeneralDetails({Key key, this.token, this.patientVisit}) : super(key: key);

  @override
  _GeneralDetailsState createState() => _GeneralDetailsState();
}

class _GeneralDetailsState extends State<GeneralDetails> {
  String temp;
  String bp;
  String pulse;
  String weight;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        // height: 90,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // shrinkWrap: true,
          // scrollDirection: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                        height: 70.0,
                        width: 80.0,
                        color: white,
                        alignment: Alignment.center),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70.0),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Align(
                        heightFactor: 1.0,
                        widthFactor: 0.8,
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          alignment: Alignment.center,
                          color: Colors.grey[700],
                          height: 30.0,
                          width: 40.0,
                          child: Text("'F",
                              style: TextStyle(color: white, fontSize: 11.0)),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 24.0, left: 20.0, child: Icon(Icons.format_size)),
                    Positioned(
                      left: 33.0,
                      child: ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          height: 20.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                            color: orangef,
                          ),
                          child: Center(
                            child: TextField(
                              autofocus: false,
                              focusNode: FocusNode(canRequestFocus: false),
                              style: TextStyle(fontSize: 12.0),
                              enabled: true,
                              textAlign: TextAlign.center,
                              onChanged: (val) async {
                                setState(() {
                                  temp = val;
                                });
                                var pv = await widget.patientVisit
                                    .checkPatient(widget.token.guid);

                                widget.patientVisit.updateTemp(pv[0], temp);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 45.0,
                        left: 10.0,
                        child: Text('Temp', style: TextStyle(fontSize: 20.0)))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                        height: 70.0,
                        width: 80.0,
                        color: white,
                        alignment: Alignment.center),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70.0),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Align(
                        heightFactor: 1.0,
                        widthFactor: 0.8,
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          alignment: Alignment.center,
                          color: Colors.grey[700],
                          height: 30.0,
                          width: 40.0,
                          child: Text("mm\nHg",
                              style: TextStyle(color: white, fontSize: 11.0)),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 24.0,
                        left: 20.0,
                        child: Icon(Icons.accessibility_new)),
                    Positioned(
                      left: 33.0,
                      child: ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          height: 20.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                            color: orangef,
                          ),
                          child: Center(
                            child: TextField(
                              autofocus: false,
                              focusNode: FocusNode(canRequestFocus: false),
                              style: TextStyle(fontSize: 12.0),
                              enabled: true,
                              textAlign: TextAlign.center,
                              onChanged: (val) async {
                                setState(() {
                                  bp = val;
                                });
                                var pv = await widget.patientVisit
                                    .checkPatient(widget.token.guid);
                                widget.patientVisit.updateBP(pv[0], bp);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 50.0,
                        left: 10.0,
                        child: Text('B.P', style: TextStyle(fontSize: 20.0)))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                        height: 70.0,
                        width: 80.0,
                        color: white,
                        alignment: Alignment.center),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70.0),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Align(
                        heightFactor: 1.0,
                        widthFactor: 0.8,
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          alignment: Alignment.center,
                          color: Colors.grey[700],
                          height: 30.0,
                          width: 40.0,
                          child: Text("bpm",
                              style: TextStyle(color: white, fontSize: 11.0)),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 24.0, left: 20.0, child: Icon(Icons.assessment)),
                    Positioned(
                      left: 33.0,
                      child: ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          height: 20.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                            color: orangef,
                          ),
                          child: Center(
                            child: TextField(
                              autofocus: false,
                              focusNode: FocusNode(canRequestFocus: false),
                              style: TextStyle(fontSize: 12.0),
                              enabled: true,
                              textAlign: TextAlign.center,
                              onChanged: (val) async {
                                setState(() {
                                  pulse = val;
                                });
                                var pv = await widget.patientVisit
                                    .checkPatient(widget.token.guid);
                                widget.patientVisit.updatePulse(pv[0], pulse);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 50.0,
                        left: 10.0,
                        child: Text('Pulse', style: TextStyle(fontSize: 20.0)))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                        height: 70.0,
                        width: 80.0,
                        color: white,
                        alignment: Alignment.center),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70.0),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Align(
                        heightFactor: 1.0,
                        widthFactor: 0.8,
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          alignment: Alignment.center,
                          color: Colors.grey[700],
                          height: 30.0,
                          width: 40.0,
                          child: Text("Kg",
                              style: TextStyle(color: white, fontSize: 11.0)),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 24.0, left: 25.0, child: Icon(Icons.av_timer)),
                    Positioned(
                      left: 33.0,
                      child: ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          height: 20.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                            color: orangef,
                          ),
                          child: Center(
                            child: TextField(
                              focusNode: FocusNode(canRequestFocus: false),
                              autofocus: false,
                              style: TextStyle(fontSize: 12.0),
                              enabled: true,
                              textAlign: TextAlign.center,
                              onChanged: (val) async {
                                setState(() {
                                  weight = val;
                                });
                                var pv = await widget.patientVisit
                                    .checkPatient(widget.token.guid);
                                widget.patientVisit.updateWeight(pv[0], weight);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 45.0,
                        left: 10.0,
                        child: Text('Weight', style: TextStyle(fontSize: 20.0)))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
