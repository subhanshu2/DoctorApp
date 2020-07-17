import 'package:flutter/material.dart';
import 'package:getcure_doctor/Database/PatientsTable.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Screens/Appointments/Appointment.dart';
import 'package:getcure_doctor/Screens/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    Provider<TokenDB>(
      create: (context) => TokenDB(),
      dispose: (context, db) => db.close(),
    ),
      Provider<PatientsVisitDB>(
      create: (context) => PatientsVisitDB(),
      dispose: (context, db) => db.close(),
    ),
     Provider<PatientsDB>(
      create: (context) => PatientsDB(),
      dispose: (context, db) => db.close(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.orange),
      home: SafeArea(
          child:SController()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SController extends StatefulWidget {
  @override
  _SControllerState createState() => _SControllerState();
}

class _SControllerState extends State<SController> {
  String p;
  isLoggedin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('docToken');
    print(token);
    if (token == null) {
      setState(() {
        p = 'login';
      });
    } else {
      setState(() {
        p = 'home';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isLoggedin();
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<TokenDB>(context);
    final patientDatabase = Provider.of<PatientsDB>(context);
    switch (p) {
      case 'login':
        return LoginPage();
      case 'home':
        return Appointments(
          database: database,
          patientDatabase: patientDatabase,
        );
      default:
        return LoginPage();
    }
  }
}
