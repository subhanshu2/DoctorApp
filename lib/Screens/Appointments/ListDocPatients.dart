import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Screens/Treatment/HomeConnector.dart';
import 'package:provider/provider.dart';

class ListDocPatients extends StatefulWidget {
  @override
  _ListDocPatientsState createState() => _ListDocPatientsState();
}

class _ListDocPatientsState extends State<ListDocPatients> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<TokenDB>(context);

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: orange,
          ),
          backgroundColor: white,
          actions: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                    onTap: () {},
                    child: Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: orange,
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {},
                    child: Container(
                      height: 34,
                      width: 34,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: green),
                    )),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
        body: StreamBuilder(
          stream:database.watchAllTasks(''),
          builder: (context, AsyncSnapshot<List<Token>> snapshot) {
            final tasks = snapshot.data ?? List();
            return Container(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tasks.length,
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  print(tasks.length);
                  return HomeConnector(token: tasks[index]);
                },
              ),
            );
          },
        ));
  }
}
