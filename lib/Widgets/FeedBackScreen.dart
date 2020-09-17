import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Models/PatientsVisitTableModels.dart';

class FeedBackScreen extends StatefulWidget {
  final Token token;
  final PatientsVisitData pat;
  const FeedBackScreen({Key key, this.token, this.pat}) : super(key: key);

  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Text("FeedBack"),
        trailing: IconButton(
            icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
      ),
      actions: [
        Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              itemCount: widget.pat.medication.data.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return Container();
              },
              itemBuilder: (BuildContext context, int index) {
                return ResponseInput(
                  data: widget.pat.medication.data[index],
                );
              },
            )),
      ],
    );
  }
}

class ResponseInput extends StatefulWidget {
  final MedicationData data;

  const ResponseInput({Key key, this.data}) : super(key: key);

  @override
  _ResponseInputState createState() => _ResponseInputState();
}

class _ResponseInputState extends State<ResponseInput> {
  @override
  void initState() {
    setState(() {
      _radioValue = "Cured Complete";
    });
    super.initState();
  }

  String _radioValue; //Initial definition of radio button value
  String choice;

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'Cured Complete':
          choice = value;
          break;
        case 'Partially Cured':
          choice = value;
          break;
        case 'Not Cured':
          choice = value;
          break;
        default:
          choice = 'Symptoms Increased';
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              widget.data.disease,
              style: TextStyle(color: blue),
            ),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  Radio(
                    value: 'Cured Complete',
                    groupValue: _radioValue,
                    onChanged: radioButtonChanges,
                  ),
                  Text(
                    "Cured Complete",
                  ),
                  Radio(
                    value: 'Partially Cured',
                    groupValue: _radioValue,
                    onChanged: radioButtonChanges,
                  ),
                  Text(
                    "Partially Cured",
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 'Not Cured',
                    groupValue: _radioValue,
                    onChanged: radioButtonChanges,
                  ),
                  Text(
                    "Not Cured",
                  ),
                  Radio(
                    value: 'Symptoms Increased',
                    groupValue: _radioValue,
                    onChanged: radioButtonChanges,
                  ),
                  Text(
                    "Symptoms Increased",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
