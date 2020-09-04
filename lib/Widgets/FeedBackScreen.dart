import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';

class FeedBackScreen extends StatefulWidget {
  final Token token;
  final PatientsVisitData pat;
  const FeedBackScreen({Key key, this.token,this.pat}) : super(key: key);

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
          child:ListView.separated(
            itemCount: widget.pat.visitReason.data.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              return ListTile(leading: Text(widget.pat.visitReason.data[index].title,style: TextStyle(color:blue),) );
            },
          )
        ),
      ],
    );
  }
}
