import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';

class FeedBackScreen extends StatefulWidget {
  final Token token;
  const FeedBackScreen({Key key, this.token}) : super(key: key);

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
            itemCount: 5,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
