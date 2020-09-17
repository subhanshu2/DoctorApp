import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Widgets/MedicineSearch.dart';
import 'package:provider/provider.dart';

class Medication extends StatefulWidget {
  final Token token;
  Medication({Key key, this.token}) : super(key: key);

  @override
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  @override
  Widget build(BuildContext context) {
    final patient = Provider.of<PatientsVisitDB>(context);

    return FutureBuilder(
      future: patient.getDiagnosis(widget.token.guid),
      builder:
          (BuildContext context, AsyncSnapshot<List<PatientsVisitData>> list) {
        switch (list.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          case ConnectionState.done:
            return ListView.separated(
                itemCount: list.data[0].diagnosis == null
                    ? 0
                    : list.data[0].diagnosis.data.length,
                physics: ScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 5,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  var md = list.data[0].medication.data.where((element) =>
                      element.disease ==
                      list.data[0].diagnosis.data[index].title);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // height: 120,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: orangef,
                              offset: new Offset(0.0, 0.0),
                              blurRadius: 5.0,
                            ),
                          ]),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            list.data[0].diagnosis.data[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ListView.builder(
                            itemCount: md.length == 0
                                ? 0
                                : md.elementAt(0).medicines.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                dense: true,
                                onLongPress: () {
                                  print(md.elementAt(0).medicines[index].title);
                                },
                                trailing: IconButton(icon: Icon(Icons.cancel), onPressed: (){
                                  patient.deleteMedicine(list.data[0],md.elementAt(0).disease , md.elementAt(0).medicines[index].title);
                                  setState(() {
                                    
                                  });
                                }),
                                leading: Text(
                                    md.elementAt(0).medicines[index].title),
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.people),
                              Icon(Icons.timelapse),
                              Icon(Icons.check_circle),
                              Icon(Icons.error_outline),
                              IconButton(
                                  icon: Icon(Icons.local_hospital),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return MedicineSearch(
                                            pId: widget.token.guid,
                                            docId: widget.token.doctorid,
                                            disease: list.data[0].diagnosis
                                                .data[index].title,
                                            fun: () => setState(() {}));
                                      },
                                    );
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
            break;
          default:
            return Text("No Data");
        }
      },
    );
  }
}
