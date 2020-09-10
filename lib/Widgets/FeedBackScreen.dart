import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';

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
                String feed;
                List<String> li = [
                  'Cured Complete',
                  'Partially Cured',
                  'Not Cured',
                  'Symptoms Increased'
                ];
                return Container(
                  height: 80,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pat.medication.data[index].disease,
                        style: TextStyle(color: blue),
                      ),
                      new DropdownButton<String>(
                        items: li.map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        value: feed,
                        isExpanded: true,
                        onChanged: (val) {
                          setState(() {
                            feed = val;
                            print(feed);
                          });
                        },
                      )
                    ],
                  ),
                );
              },
            )),
      ],
    );
  }
}
