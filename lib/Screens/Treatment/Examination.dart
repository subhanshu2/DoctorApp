import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Widgets/ExaminationSearchBar.dart';

class Examination extends StatefulWidget {
  final Token token;
  Examination({Key key, this.token}) : super(key: key);

  @override
  _ExaminationState createState() => _ExaminationState();
}

class _ExaminationState extends State<Examination> {
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
                      ExpansionTile(title: Text('Examination'), children: []),
                ),
                IconButton(
                    icon: Icon(
                      Icons.local_hospital,
                      color: orange,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ExaminationSearchBar();
                        },
                      );
                    }),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
