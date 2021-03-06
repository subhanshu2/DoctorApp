import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/SymptomsTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/Navigation.dart';
import 'package:getcure_doctor/Screens/Appointments/ListDocPatients.dart';
import 'package:getcure_doctor/Screens/login.dart';
import 'package:getcure_doctor/Widgets/SlotTiming.dart';
import 'package:getcure_doctor/provider/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatelessWidget {
  final String name;
  final String clinicid;
  final int docId;
  const DrawerWidget({Key key, this.name, this.clinicid, this.docId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<TokenDB>(context);
    final symptomDatabase = Provider.of<SymptomsDB>(context);

    return Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              currentAccountPicture:
                  Container(child: Image.asset('images/docbg.png')),
              accountName: new Text(
                "Dr. $name",
                style:
                    new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              accountEmail: new Text(
                "$name@gmail.com",
                style:
                    new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              )),
          ListTile(
            title: Text('Profile Page'),
            trailing: Icon(Icons.account_box),
            onTap: () {
              Navigator.of(context).pop();
              //changeScreen(context, ProfilePage());
            },
          ),
          ListTile(
            title: Text('Doctor Invoice'),

            trailing: Icon(Icons.inbox),
            onTap: () {
              Navigator.of(context).pop();
              //changeScreen(context, DrInvoice());
            },
          ),
          ListTile(
            title: Text('Hospital Invoice'),
            trailing: Icon(Icons.local_hospital),
            onTap: () {
              Navigator.of(context).pop();
              // changeScreen(context,HospitalInvoice(
              //       clinicId: clinicid,
              //     ));
            },
          ),
          // ListTile(
          //   title: Text('Slot timing'),
          //   trailing: Icon(Icons.timer),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //     changeScreen(context,SlotTimings());
          //   },
          // ),
          ListTile(
            title: Text('Doctor Section'),
            trailing: Icon(Icons.art_track),
            onTap: () {
              Navigator.of(context).pop();
              changeScreen(
                  context,
                  ChangeNotifierProvider(
                    create: (context) => DoctorProvider(),
                    child: ListDocPatients(
                      databse: symptomDatabase,
                      docId: docId,
                    ),
                  ));
            },
          ),
          ListTile(
            trailing: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.clear();
              database.deleteallTask();
              changeScreenRepacement(context, LoginPage());
            },
          ),
        ],
      ),
    );
  }
}
