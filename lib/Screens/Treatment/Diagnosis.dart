import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';

class Diagnosis extends StatefulWidget {
  final Token token;
  Diagnosis({Key key, this.token}) : super(key: key);

  @override
  _DiagnosisState createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child:
                      ExpansionTile(title: Text('Diagnosis'), children: []),
                ),
                IconButton(
                    icon: Icon(
                      Icons.local_hospital,
                      color: orange,
                    ),
                    onPressed: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return ExaminationSearchBar();
                      //   },
                      // );
                    }),
              ],
            ),
          ),
        ],
      )),
    );
  }
}