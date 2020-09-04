import 'package:flutter/material.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';

class AddMedicine extends StatefulWidget {
  final String pId;
  final int docId;
  AddMedicine({Key key, this.pId, this.docId}) : super(key: key);

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          alignment: Alignment.center,
          color: orangep,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Add Medication',
                  style: TextStyle(color: white),
                ),
                IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Form(
              child: Column(
                children: [
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        labelText: 'Medicine Name',
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        labelText: 'Salt Composition',
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        labelText: 'Severe Interaction Drugs',
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                        ),
                        labelText: 'Select Category',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Default Parameters",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
