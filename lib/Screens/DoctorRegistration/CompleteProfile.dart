import 'package:flutter/material.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';

class CompleteProfile extends StatefulWidget {
  CompleteProfile({Key key}) : super(key: key);

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  int currentStep = 0;
  List<Step> mySteps = [
    Step(
        title: Text('YOUR PROFILE'),
        content: Text(''),
        isActive: true,
        subtitle: Text('Ms. Manju')),
    Step(
        title: Text('CLINIC'),
        content: Text('manju'),
        isActive: true),
    Step(
        title: Text('UPLOAD DOCUMENTS'),
        content: Container(
          child: Column(
            children: <Widget>[
              RichText(text: TextSpan(
                text: 'Submit a photo ID for Ms.Manju\n',
                    style: TextStyle(
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'This is to verify that you are who you say you are.Example: Passport, AadharUID, Pan Card, Election Commision Card, DL, Ration Card with photo\n',
                        style: TextStyle(
                            color: black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ]
              )),
              Align(
                alignment: Alignment.bottomLeft,
                  child: FlatButton(
                  onPressed: () {
                   
                  } ,
                  child: Text('Upload', 
                    style: TextStyle(
                    color: orangef,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,)
                  ),
                  ),
              ),
              Divider(),
               RichText(text: TextSpan(
                text: 'Submit Clinic ownership document for manju\n',
                    style: TextStyle(
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'This is to verify that you are are registered healthcare professional.Example: Clinic letter head/prescription pad stating you are the clinic owner with your signature, Clinic Registration Proof, Document for waste disposal, Sales tax receipt for clinic\n',
                        style: TextStyle(
                            color: black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ]
              )),
              Align(
                alignment: Alignment.bottomLeft,
                  child: FlatButton(
                  onPressed: () {
                    // getImage();
                  } ,
                  child: Text('Upload', 
                    style: TextStyle(
                    color: orangef,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,)
                  ),
                  ),
              ),
          ],),
        ),
        // state: StepState.editing,
        isActive: true),
  ];

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 210.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          stops: [0.5, 1.0],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            pcolor,
                            orangef,
                          ]),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            icon: Icon(
                              Icons.info,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            onPressed: () {
                               //changeScreen(context, Appointments());
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0, left: 10.0),
                        child: Wrap(
                          children: <Widget>[
                            Text(
                              'You are 1 step away from completing your profile',
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: _mainListBuilder,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainListBuilder(BuildContext context, int index) {
    if (index == 0)
      return Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
          child: Text("Steps", ));
    return _buildMainItem(context);
  }

  Widget _buildMainItem(BuildContext context) {
    return Container(
      child: Stepper(
        physics: ClampingScrollPhysics(),
        currentStep: currentStep,
        steps: mySteps,
        type: StepperType.vertical,
        onStepTapped: (step) {
          setState(() {
            currentStep = step;
          });
        },
        onStepCancel: () {
          setState(() {
            if (currentStep > 0) {
              currentStep = currentStep - 1;
            } else {
              currentStep = 0;
            }
          });
        },
        onStepContinue: () {
          switch (currentStep) {
            case 0:
             // changeScreen(context, CreateProfile());
              setState(() {
                currentStep += 1;
              });
              break;
            case 1:
              //changeScreen(context, ClinicDetails());
              setState(() {
                currentStep +=1;
              });
              break;
            case 2:
              AlertDialog();
              setState(() {
                currentStep = 0;
              });
              break;
            default:
              //changeScreen(context, CreateProfile());
              setState(() {
                currentStep += 1;
              });
              break;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
}
