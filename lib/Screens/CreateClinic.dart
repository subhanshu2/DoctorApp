import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:getcure_doctor/Helpers/colors.dart';

class CreateClinic extends StatefulWidget {
  @override
  _CreateClinicState createState() => _CreateClinicState();
}

class _CreateClinicState extends State<CreateClinic> {

  _CreateClinicState() {
    locationTextField = new AutoCompleteTextField<LocationSearch>(

      decoration: new InputDecoration(
        icon: Icon(Icons.location_on),
        hintText: "Location", suffixIcon: new Icon(Icons.search)),
      itemSubmitted: (item) => setState(() => selected = item),
      key: key,
      suggestions: locationsugg,
      itemBuilder: (context, suggestion) => new Padding(
          child: new ListTile(
            title: new Text(suggestion.name),
          ),
          padding: EdgeInsets.all(8.0)),
      itemSorter: (a, b) => a.id == b.id ? 0 : a.id > b.id ? -1 : 1,
      itemFilter: (suggestion, input) =>
          suggestion.name.toLowerCase().startsWith(input.toLowerCase()),
    );
  }

  List<LocationSearch> locationsugg = [
    LocationSearch(1, 'kalkaji'),
    LocationSearch(3, 'Anand Vihar'),
    LocationSearch(2, 'govindpuri')
  ];
 
  GlobalKey key = new GlobalKey<AutoCompleteTextFieldState<LocationSearch>>();

  AutoCompleteTextField<LocationSearch> locationTextField;

  String clinicname;
  String clinicnumber;
  String fees;
  String address;
  String phoneNo;
  LocationSearch selected;

  bool _autoValidate = false;
  bool isSelected=false;
  //List<dynamic> timings=timereturn();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String validateName(String value) {
    if (value.length < 3)
      return 'Please enter a valid name';
    else
      return null;
  }

  String validateAddress(String value) {
    if (value.length < 3)
      return 'Please enter a valid address';
    else
      return null;
  }

  String validateNumber(String value) {
    if (value.isEmpty)
      return 'Please enter a valid number';
    else
      return null;
  }

  String validateFees(String value) {
    if (value.isEmpty)
      return 'Please enter a valid number';
    else
      return null;
  }

  String validateMobile(String value) {
    if (value.isEmpty) {
      return "Field can't be empty";
    } else if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  // void _validateInputs() async{
  //   if (_formKey.currentState.validate()) {
  //     _formKey.currentState.save();
  //     if(await addClinic(clinicname,selected.id,selected.name,double.parse(fees),double.parse(fees),address,timereturn(), phoneNo)){
  //       changeScreen(context,AddEducation());
  //     }else{
  //       changeScreen(context, CreateClinic());
  //     }
  //   } else {
  //     setState(() {
  //       _autoValidate = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print("Clinic timings");
    //print(timereturn());
    // print("Clinic pe timings=" +timings.toList().toString());
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: orangef,
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){},
                 child: IconButton(
                   color: white,
                   icon: Icon(Icons.assignment_turned_in),
                  //onPressed: _validateInputs,
                ),
              ),
            ),
          ),
        ],
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: ()=>Navigator.pop(context)),
        title: new Text('Creating Clinic'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(5.0),
          child: new Form(
            autovalidate: _autoValidate,
            key: this._formKey,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      new TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                            icon: Icon(Icons.portrait),
                            hintText: 'Your clinic name',
                            labelText: 'Clinic Name',
                          ),
                          validator:validateName,
                          onSaved: (String value) {
                            clinicname = value;
                        }
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 15),
                        child: selected == null
                            ? locationTextField
                            : Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                     Row(
                                       children: <Widget>[
                                          Icon(Icons.location_on,color:grey),
                                          SizedBox(width: 12.0,),
                                          Text(
                                            selected.name,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                       ],
                                     ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.cancel,
                                            color: red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              selected = null;
                                            });
                                          })
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40.0),
                                    child: Divider(
                                      color: black,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top:20.0),
                    ),
                    new TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            icon: Icon(Icons.confirmation_number),
                            hintText: 'Clinic Regsiration Number',
                            labelText: 'Clinic Number',
                          ),
                          validator:validateNumber,
                          onSaved: (String value) {
                            clinicnumber = value;
                        }

                      ),
                       Padding(
                      padding: EdgeInsets.only(top:20.0),
                    ),
                      new TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            icon: Icon(Icons.timer),
                            hintText: 'Checking Fees',
                            labelText: 'Fees',
                          ),
                          validator:validateFees,
                          onSaved: (String value) {
                            fees = value;
                        }
                      ),
                       Padding(
                      padding: EdgeInsets.only(top:20.0),
                    ),
                       new TextFormField(
                          decoration: new InputDecoration(
                            icon: Icon(Icons.location_searching),
                            hintText: 'Enter clinic address',
                            labelText: 'Address',
                          ),
                          validator:validateAddress,
                          onSaved: (String value) {
                            address = value;
                        }
                      ),
                       Padding(
                      padding: EdgeInsets.only(top:20.0),
                    ),
                       new TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            icon: Icon(Icons.phone),
                            hintText: 'Phone no',
                            labelText: 'Phone No',
                          ),
                          validator:validateMobile,
                          onSaved: (String value) {
                            phoneNo = value;
                        },
                      ),
                      Padding(
                      padding: EdgeInsets.only(top:20.0),
                    ),
                      new TextFormField(
                          decoration: new InputDecoration(
                            icon: Icon(Icons.timer),
                            labelText: 'Add your timings at the clinic',
                            suffixIcon: Icon(Icons.arrow_forward),
                          ),
                          initialValue:"timings",
                          onTap: (){
                          //   Navigator.push(context, MaterialPageRoute(
                          //       builder: (context)=>WeekTimings()
                          //       )
                          //   );
                          // },
                          // onSaved: (String value) {
                          //   //code left
                          //   timings=timereturn();
                          }
                      ),
                       Padding(
                      padding: EdgeInsets.only(top:20.0),
                    ),
                      // new TextFormField(
                      //     decoration: new InputDecoration(
                      //       icon: Icon(Icons.access_time),
                      //       labelText: 'Add Clinic Timings',
                      //       suffixIcon: Icon(Icons.arrow_forward),
                      //     ),
                      //     onTap: (){
                      //       Navigator.push(context, MaterialPageRoute(
                      //           builder: (context)=>AddEducation())
                      //       );
                      //     },
                      //     onSaved: (String value) {
                      //       //code left
                      //     }
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

class DegreeSearch {
  int id;
  String name;
  DegreeSearch(this.id, this.name);
}

class LocationSearch {
  int id;
  String name;
  LocationSearch(this.id, this.name);
}


