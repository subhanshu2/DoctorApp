import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Screens/Treatment/HomeConnector.dart';
import 'package:provider/provider.dart';

class ListDocPatients extends StatefulWidget {
  @override
  _ListDocPatientsState createState() => _ListDocPatientsState();
}

class _ListDocPatientsState extends State<ListDocPatients> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<TokenDB>(context);
    int tokenno;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: orange,
          ),
          backgroundColor: white,
          actions: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                    onTap: () {},
                    child: Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: orange,
                      ),
                      child: Center(child: Text(tokenno.toString())),
                    )),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {},
                    child: Container(
                      height: 34,
                      width: 34,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: green),
                    )),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
        body: StreamBuilder(
          stream: database.watchAllbookedTasks(),
          builder: (context, AsyncSnapshot<List<Token>> snapshot) {
            final tasks = snapshot.data ?? List();
            return Container(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tasks.length,
                // shrinkWrap: true,
                onPageChanged: (int index) async {
                  final patient = Provider.of<PatientsVisitDB>(context,listen: false);
                  List<PatientsVisitData> result =
                      await patient.checkPatient(tasks[index].guid);
                  if (result.isEmpty) {
                    final p = PatientsVisitData(
                        mobileNo: tasks[index].mobileno,
                        patientName: tasks[index].name,
                        patientId: tasks[index].guid.toString(),
                        age: tasks[index].age,
                        clinicDoctorId: tasks[index].doctorid);
                    patient.insert(p);
                  } else {
                    print('preseent');
                    PatientsVisitData r = result[0];
                    final p = PatientsVisitData(
                        mobileNo: r.mobileNo,
                        patientName: r.patientName,
                        temperature: r.temperature,
                        pulse: r.pulse,
                        patientId: r.patientId,
                        visitReason: r.visitReason,
                        age: r.age,
                        briefHistory: r.briefHistory,
                        allergies: r.allergies,
                        clinicDoctorId: r.clinicDoctorId,
                        diagnosis: r.diagnosis,
                        examination: r.examination,
                        lifestyle: r.lifestyle,
                        medication: r.medication,
                        weight: r.weight);
                    patient.insert(p);
                    // print(tokenno);
                  }
                },
                itemBuilder: (context, index) {
                  return HomeConnector(token: tasks[index]);
                },
              ),
            );
          },
        ));
  }
}
