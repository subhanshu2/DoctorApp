import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Widgets/ExamResult.dart';
import 'package:getcure_doctor/Widgets/ExaminationSearchBar.dart';
import 'package:provider/provider.dart';

class Examination extends StatefulWidget {
  final Token token;
  Examination({Key key, this.token}) : super(key: key);

  @override
  _ExaminationState createState() => _ExaminationState();
}

class _ExaminationState extends State<Examination> {
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
                      title: Text('Examination'),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.local_hospital,
                            color: orange,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ExaminationSearchBar(
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
                                  itemCount:
                                      snapshot.data[0].examination == null
                                          ? 0
                                          : snapshot
                                              .data[0].examination.data.length,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) {
                                            return SingleChildScrollView(
                                              child: ExamResult(
                                                exmdata: snapshot.data[0]
                                                    .examination.data[index],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      title: Text(snapshot.data[0].examination
                                          .data[index].title),
                                      subtitle: Text(
                                          '(${snapshot.data[0].examination.data[index].status})'),
                                      trailing: IconButton(
                                          icon: Icon(Icons.cancel),
                                          onPressed: () {
                                            patient.deleteExam(
                                                snapshot.data[0],
                                                snapshot.data[0].examination
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
