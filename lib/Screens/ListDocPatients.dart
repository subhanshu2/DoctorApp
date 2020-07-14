import 'package:flutter/material.dart';
import 'package:getcure_doctor/Screens/PatientInfo.dart';

class ListDocPatients extends StatefulWidget {
  @override
  _ListDocPatientsState createState() => _ListDocPatientsState();
}

class _ListDocPatientsState extends State<ListDocPatients> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          return PatientInfo();
        },
      ),
    );
  }
}
