import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/ExaminationTable.dart';

class ExaminationProvider extends ChangeNotifier {
  List<ParameterData> parametersList = [];

  addParameter(ParameterData parameterData) {
    parametersList.add(parameterData);
  }
}
