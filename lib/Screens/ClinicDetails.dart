import 'package:flutter/material.dart';
import 'package:getcure_doctor/Helpers/colors.dart';

class ClinicDetails extends StatefulWidget {
  ClinicDetails({Key key}) : super(key: key);

  @override
  _ClinicDetailsState createState() => _ClinicDetailsState();
}

class _ClinicDetailsState extends State<ClinicDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: orangef,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: Icon(Icons.info),
          ),
        ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
        title: new Text('ADD CLINIC'),
      ),
      
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: RichText(
                text: TextSpan(
                    text: 'Add clinic to your profile\n\n',
                    style: TextStyle(
                        color: black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Clinic owner will have to provide proof of ownership.\n\n',
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      TextSpan(
                        text:
                            'Visiting consultants will not be able to edit information for their clinics.',
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      )
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                child: Text(
                  'ADD AS VISITING CLINIC',
                  style: TextStyle(
                      color: white, fontSize: 18, fontWeight: FontWeight.w300),
                ),
                color: orangep,
                onPressed: (){},
                //onPressed: () =>changeScreen(context, AddClinic())
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: (){},
                child: Text(
                  'ADD AS OWNED CLINIC',
                  style: TextStyle(
                      color: white, fontSize: 18, fontWeight: FontWeight.w300),
                ),
                color: orangep,
                // onPressed: () =>changeScreen(context,CreateClinic()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
