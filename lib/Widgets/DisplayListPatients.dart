import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';

class DisplayLists extends StatefulWidget {
  final TokenDB token;
  DisplayLists({Key key, this.token}) : super(key: key);

  @override
  _DisplayListsState createState() => _DisplayListsState();
}

class _DisplayListsState extends State<DisplayLists> {
  List<Token> ans = [];
  @override
  void initState() {
    super.initState();
    getAllEntries();
  }

  void getAllEntries() async {
    List<Token> lists =
        await widget.token.getAllBookedTokens().then((value) => ans = value);
    print(ans);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          color: orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(child: Text('Patients List')),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close))
            ],
          ),
        ),
        actions: <Widget>[
          Stack(
            // fit: StackFit.expand,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.8,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Flexible(
                      flex: ans.length,
                      child: Container(
                        color: orangef,
                        child: ExpansionTile(
                            leading: Text("Completed Appointments"),
                            backgroundColor: white,
                            children: [
                              StreamBuilder(
                                stream: widget.token.watchAllbookedTasks(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Token>> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return CircularProgressIndicator();
                                      break;
                                    default:
                                      return ListView.builder(
                                        itemCount: snapshot.data.length,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: grey))),
                                            child: ListTile(
                                              title: Text(
                                                  snapshot.data[index].name,
                                                  style: TextStyle(
                                                      color: (snapshot
                                                              .data[index]
                                                              .isOnline)
                                                          ? (green)
                                                          : (snapshot
                                                                      .data[
                                                                          index]
                                                                      .cancelled ==
                                                                  (true)
                                                              ? (grey)
                                                              : (snapshot
                                                                          .data[
                                                                              index]
                                                                          .appointmenttype ==
                                                                      ('emergency')
                                                                  ? (red)
                                                                  : (snapshot.data[index]
                                                                              .bookedtype ==
                                                                          ('on call')
                                                                      ? orangef
                                                                      : blueGrey))))),
                                              trailing: Text(
                                                  snapshot.data[index].address
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: (snapshot
                                                              .data[index]
                                                              .isOnline)
                                                          ? (green)
                                                          : (snapshot
                                                                      .data[
                                                                          index]
                                                                      .cancelled ==
                                                                  (true)
                                                              ? (grey)
                                                              : (snapshot
                                                                          .data[
                                                                              index]
                                                                          .appointmenttype ==
                                                                      ('emergency')
                                                                  ? (red)
                                                                  : (snapshot.data[index]
                                                                              .bookedtype ==
                                                                          ('on call')
                                                                      ? orangef
                                                                      : blueGrey))))),
                                              leading: Text(
                                                  snapshot.data[index].tokenno
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: (snapshot
                                                              .data[index]
                                                              .isOnline)
                                                          ? (green)
                                                          : (snapshot
                                                                      .data[
                                                                          index]
                                                                      .cancelled ==
                                                                  (true)
                                                              ? (grey)
                                                              : (snapshot
                                                                          .data[
                                                                              index]
                                                                          .appointmenttype ==
                                                                      ('emergency')
                                                                  ? (red)
                                                                  : (snapshot.data[index]
                                                                              .bookedtype ==
                                                                          ('on call')
                                                                      ? orangef
                                                                      : blueGrey))))),
                                            ),
                                          );
                                        },
                                      );

                                      break;
                                  }
                                },
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Flexible(
                      flex: ans.length,
                      child: Container(
                        color: orangef,
                        child: ExpansionTile(
                            backgroundColor: white,
                            leading: Text("Present Patients"),
                            children: [
                              StreamBuilder(
                                stream: widget.token.watchAllbookedTasks(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Token>> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return CircularProgressIndicator();
                                      break;
                                    default:
                                      return ListView.builder(
                                        itemCount: snapshot.data.length,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            title: Text(
                                                snapshot.data[index].name,
                                                style: TextStyle(
                                                    color: (snapshot.data[index]
                                                            .isOnline)
                                                        ? (green)
                                                        : (snapshot.data[index]
                                                                    .cancelled ==
                                                                (true)
                                                            ? (grey)
                                                            : (snapshot
                                                                        .data[
                                                                            index]
                                                                        .appointmenttype ==
                                                                    ('emergency')
                                                                ? (red)
                                                                : (snapshot.data[index]
                                                                            .bookedtype ==
                                                                        ('on call')
                                                                    ? orangef
                                                                    : blueGrey))))),
                                            trailing: Text(
                                                snapshot.data[index].address
                                                    .toString(),
                                                style: TextStyle(
                                                    color: (snapshot.data[index]
                                                            .isOnline)
                                                        ? (green)
                                                        : (snapshot.data[index]
                                                                    .cancelled ==
                                                                (true)
                                                            ? (grey)
                                                            : (snapshot
                                                                        .data[
                                                                            index]
                                                                        .appointmenttype ==
                                                                    ('emergency')
                                                                ? (red)
                                                                : (snapshot.data[index]
                                                                            .bookedtype ==
                                                                        ('on call')
                                                                    ? orangef
                                                                    : blueGrey))))),
                                            leading: Text(
                                                snapshot.data[index].tokenno
                                                    .toString(),
                                                style: TextStyle(
                                                    color: (snapshot.data[index]
                                                            .isOnline)
                                                        ? (green)
                                                        : (snapshot.data[index]
                                                                    .cancelled ==
                                                                (true)
                                                            ? (grey)
                                                            : (snapshot
                                                                        .data[
                                                                            index]
                                                                        .appointmenttype ==
                                                                    ('emergency')
                                                                ? (red)
                                                                : (snapshot.data[index]
                                                                            .bookedtype ==
                                                                        ('on call')
                                                                    ? orangef
                                                                    : blueGrey))))),
                                          );
                                        },
                                      );

                                      break;
                                  }
                                },
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Flexible(
                      flex: ans.length,
                      child: Container(
                        color: orangef,
                        child: ExpansionTile(
                            backgroundColor: white,
                            leading: Text("Booked Appointments"),
                            children: [
                              StreamBuilder(
                                stream: widget.token.watchAllbookedTasks(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Token>> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return CircularProgressIndicator();
                                      break;
                                    default:
                                      return ListView.builder(
                                        itemCount: snapshot.data.length,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            title: Text(
                                                snapshot.data[index].name,
                                                style: TextStyle(
                                                    color: (snapshot.data[index]
                                                            .isOnline)
                                                        ? (green)
                                                        : (snapshot.data[index]
                                                                    .cancelled ==
                                                                (true)
                                                            ? (grey)
                                                            : (snapshot
                                                                        .data[
                                                                            index]
                                                                        .appointmenttype ==
                                                                    ('emergency')
                                                                ? (red)
                                                                : (snapshot.data[index]
                                                                            .bookedtype ==
                                                                        ('on call')
                                                                    ? orangef
                                                                    : blueGrey))))),
                                            trailing: Text(
                                                snapshot.data[index].address
                                                    .toString(),
                                                style: TextStyle(
                                                    color: (snapshot.data[index]
                                                            .isOnline)
                                                        ? (green)
                                                        : (snapshot.data[index]
                                                                    .cancelled ==
                                                                (true)
                                                            ? (grey)
                                                            : (snapshot
                                                                        .data[
                                                                            index]
                                                                        .appointmenttype ==
                                                                    ('emergency')
                                                                ? (red)
                                                                : (snapshot.data[index]
                                                                            .bookedtype ==
                                                                        ('on call')
                                                                    ? orangef
                                                                    : blueGrey))))),
                                            leading: Text(
                                                snapshot.data[index].tokenno
                                                    .toString(),
                                                style: TextStyle(
                                                    color: (snapshot.data[index]
                                                            .isOnline)
                                                        ? (green)
                                                        : (snapshot.data[index]
                                                                    .cancelled ==
                                                                (true)
                                                            ? (grey)
                                                            : (snapshot
                                                                        .data[
                                                                            index]
                                                                        .appointmenttype ==
                                                                    ('emergency')
                                                                ? (red)
                                                                : (snapshot.data[index]
                                                                            .bookedtype ==
                                                                        ('on call')
                                                                    ? orangef
                                                                    : blueGrey))))),
                                          );
                                        },
                                      );

                                      break;
                                  }
                                },
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
