import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Widgets/SearchBarDiagnosis.dart';
import 'package:provider/provider.dart';

class Diagnosis extends StatefulWidget {
  final Token token;
  Diagnosis({Key key, this.token}) : super(key: key);

  @override
  _DiagnosisState createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  @override
  Widget build(BuildContext context) {
    final patient = Provider.of<PatientsVisitDB>(context);

    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: ExpansionTile(
                      title: Text('Diagnosis'),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.local_hospital,
                            color: orange,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SearchBarDiagnosis(
                                  pId: widget.token.guid,
                                  docId: widget.token.doctorid,
                                );
                              },
                            );
                          }),
                      children: [
                        StreamBuilder(
                          stream: patient.getBriefHistory(widget.token.guid),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<PatientsVisitData>> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return CircularProgressIndicator();
                                break;
                              default:
                                return ListView.builder(
                                  itemCount: snapshot.data[0].diagnosis == null
                                      ? 0
                                      : snapshot.data[0].diagnosis.data.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(snapshot
                                          .data[0].diagnosis.data[index].title),
                                      trailing: IconButton(
                                          icon: Icon(Icons.cancel),
                                          onPressed: () {
                                            patient.deleteDiagnosis(
                                                snapshot.data[0],
                                                snapshot.data[0].diagnosis
                                                    .data[index].title);
                                            patient.deleteBrief(
                                                snapshot.data[0],
                                                snapshot.data[0].briefHistory
                                                    .data[index].title);
                                          }),
                                    );
                                  },
                                );

                                break;
                              // default:
                              //   return Text('NO Data');
                              //   break;
                            }
                          },
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
