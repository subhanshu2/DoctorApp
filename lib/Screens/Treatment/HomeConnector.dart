import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/SymptomsTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Screens/Appointments/PatientInfo.dart';
import 'package:getcure_doctor/Screens/Treatment/Diagnosis.dart';
import 'package:getcure_doctor/Screens/Treatment/Examination.dart';
import 'package:getcure_doctor/Screens/Treatment/Symptoms.dart';
import 'package:getcure_doctor/Widgets/generalDetails.dart';
import 'package:provider/provider.dart';
import '../../Helpers/AppConfig/colors.dart';
import 'Medication.dart';

String temp;
String bp;
String pulse;
String weight;

class HomeConnector extends StatefulWidget {
  final Token token;

  const HomeConnector({Key key, this.token}) : super(key: key);
  @override
  _HomeConnectorState createState() => _HomeConnectorState();
}

class _HomeConnectorState extends State<HomeConnector>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    setState(() {
      tabController = TabController(length: 4, vsync: this);
    });
  }

  getData(var pat) async {
    print("General Details");
    List<PatientsVisitData> pd = await pat.checkPatient(widget.token.guid);
    print(pd);
    // setState(() {
    //   temp = pd[0].temperature.toString();
    //   bp = pd[0].bp.toString();
    //   pulse = pd[0].pulse.toString();
    //   weight = pd[0].weight.toString();
    // });
  }

  final controller = PageController(
    initialPage: 0,
  );
  List<Widget> tabsFun(BuildContext context) {
    final tabpages = <Widget>[
      Symtoms(
        token: widget.token,
      ),
      Examination(token: widget.token,),
      Diagnosis(
        token: widget.token,
      ),
      Medication(token: widget.token)
    ];
    return tabpages;
  }

  final tabs = <Tab>[
    Tab(
      text: 'Symptom',
    ),
    Tab(
      text: 'Examination',
    ),
    Tab(
      text: 'Diagnosis',
    ),
    Tab(
      text: 'Medication',
    )
  ];
  var scrollDirection = Axis.horizontal;

  Widget getDesigns() {
    switch (tabController.index) {
      case 0:
        return upperDesign0;
      case 1:
        // changeDesign();
        return upperDesign1;
      case 3:
        return upperDesign3;
      default:
        return upperDesign1;
    }
  }

  final upperDesign3 = Container(
    color: Colors.teal,
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Similar Patients'),
              Text('Treatment Time'),
              Text('Success Rate'),
              Text('Side Effects'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('121'),
              Text('6-10 Days'),
              Text('95%'),
              Text('3%')
            ],
          ),
        ),
      ],
    ),
  );

  final upperDesign1 = Container(
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Center(child: Text('Brief History')),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Asthama (2 Months)'),
            Text('HyperTension (6 Months)'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Asthama (2 Months)'),
            Text('HyperTension (6 Months)'),
          ],
        ),
      ],
    ),
  );

  final upperDesign0 = Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
      )),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: CustomBoxes(
            label: "Temp",
            unit: "'F",
            value: "100",
            icon: Icon(
              Icons.accessibility_new,
              size: 30.0,
            ),
          )),
          Flexible(
              child: CustomBoxes(
            label: "B.P",
            unit: "BFG",
            value: "130/80",
            icon: Icon(Icons.accessible, size: 30.0),
          )),
          Flexible(
              child: CustomBoxes(
            label: "Pulse",
            unit: "bpm",
            value: "75",
            icon: Icon(Icons.assessment, size: 30.0),
          )),
          Flexible(
              child: CustomBoxes(
                  label: "Weight",
                  unit: "Kg",
                  value: "71",
                  icon: Icon(Icons.av_timer, size: 30.0))),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    final patient = Provider.of<PatientsVisitDB>(context);
    final pt = Provider.of<SymptomsDB>(context);
    // final generaldata =getData(patient);
    // getDesigns();
    return Scaffold(
        body: PageView(
      controller: controller,
      scrollDirection: scrollDirection,
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: grey300,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(widget.token.name),
                      ],
                    ),
                    Text(widget.token.age.toString() + " yr"),
                    Text(widget.token.gender.toUpperCase()),
                    IconButton(
                        icon: Icon(Icons.create),
                        onPressed: () async {
                          await pt.deleteallTask();
                          // for(var i in s){
                          //   print(i.title);
                          // }
                          // List<PatientsVisitData> result =
                          //     await patient.checkPatient(widget.token.guid);
                          // if (result.isEmpty) {
                          //   final p = PatientsVisitData(
                          //       mobileNo: widget.token.mobileno,
                          //       patientName: widget.token.name,
                          //       patientId: widget.token.guid.toString(),
                          //       age: widget.token.age,
                          //       clinicDoctorId: widget.token.doctorid);
                          //   patient.insert(p);
                          // } else {
                          //   print('preseent');
                          //   PatientsVisitData r = result[0];
                          //   final p = PatientsVisitData(
                          //       mobileNo: r.mobileNo,
                          //       patientName: r.patientName,
                          //       temperature: r.temperature,
                          //       pulse: r.pulse,
                          //       patientId: r.patientId,
                          //       visitReason: r.visitReason,
                          //       age: r.age,
                          //       briefHistory: r.briefHistory,
                          //       allergies: r.allergies,
                          //       clinicDoctorId: r.clinicDoctorId,
                          //       diagnosis: r.diagnosis,
                          //       examination: r.examination,
                          //       lifestyle: r.lifestyle,
                          //       medication: r.medication,
                          //       weight: r.weight);
                          //   patient.insert(p);
                          // }
                        })
                  ],
                ),
              ),

              // if (tabController.index == 0)
              //   upperDesign0
              // else if (tabController.index == 1)
              //   upperDesign1
              // else if (tabController.index == 3)
              //   upperDesign3
              // else
              //   upperDesign1,
              // getDesigns(),
              GeneralDetails(
                  token: widget.token, patientVisit: patient, temp: "109"),
              TabBar(
                onTap: (value) {
                  setState(() {
                    getDesigns();
                  });
                },
                controller: tabController,
                tabs: tabs,
                labelColor: black,
                isScrollable: true,
              ),
              DefaultTabController(
                  length: tabs.length,
                  // initialIndex: 0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.7,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.loose,
                          child: TabBarView(
                              controller: tabController,physics: ScrollPhysics(),
                              children: tabsFun(context)),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        )
      ],
    ));
  }
}
