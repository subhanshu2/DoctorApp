import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/ExaminationTable.dart';

class ExaminationProvider extends ChangeNotifier {
  Parameters parametersList;

  addParameter(ParameterData parameterData) {
    parametersList.data.add(parameterData);
  }
}
