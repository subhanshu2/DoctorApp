import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Screens/DoctorRegistration/AddClinic.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  _CreateProfileState() {
    cityTextField = new AutoCompleteTextField<CitySearch>(
      decoration: new InputDecoration(
          icon: Icon(Icons.location_city),
          hintText: "City",
          suffixIcon: new Icon(Icons.search)),
      itemSubmitted: (item) => setState(() => selected = item),
      key: key,
      suggestions: suggestions,
      itemBuilder: (context, suggestion) => new Padding(
          child: new ListTile(
            title: new Text(suggestion.name),
          ),
          padding: EdgeInsets.all(8.0)),
      itemSorter: (a, b) => a.id == b.id ? 0 : a.id > b.id ? -1 : 1,
      itemFilter: (suggestion, input) =>
          suggestion.name.toLowerCase().startsWith(input.toLowerCase()),
    );
    specialityTextField = new AutoCompleteTextField<SpecialitySearch>(
      decoration: new InputDecoration(
          icon: Icon(Icons.assignment_ind),
          hintText: "Speciality",
          suffixIcon: new Icon(Icons.search)),
      itemSubmitted: (item) => setState(() => sselected = item),
      key: lkey,
      suggestions: specialsugg,
      itemBuilder: (context, specialsugg) => new Padding(
          child: new ListTile(
            title: new Text(specialsugg.name),
          ),
          padding: EdgeInsets.all(8.0)),
      itemSorter: (a, b) => a.id == b.id ? 0 : a.id > b.id ? -1 : 1,
      itemFilter: (specialsugg, input) =>
          specialsugg.name.toLowerCase().startsWith(input.toLowerCase()),
    );
    educationTextField = new AutoCompleteTextField<LocalitySearch>(
      decoration: new InputDecoration(
          icon: Icon(Icons.book),
          hintText: "Educational-Qualifications",
          suffixIcon: new Icon(Icons.search)),
      itemSubmitted: (item) => setState(() => eselected = item),
      key: ekey,
      suggestions: lsugg,
      itemBuilder: (context, lsugg) => new Padding(
          child: new ListTile(
            title: new Text(lsugg.name),
          ),
          padding: EdgeInsets.all(8.0)),
      itemSorter: (a, b) => a.id == b.id ? 0 : a.id > b.id ? -1 : 1,
      itemFilter: (lsugg, input) =>
          lsugg.name.toLowerCase().startsWith(input.toLowerCase()),
    );
  }

  List<LocalitySearch> lsugg = [
    LocalitySearch(1, 'kalkaji'),
    LocalitySearch(3, 'Anand Vihar'),
    LocalitySearch(2, 'govindpuri')
  ];
  List<SpecialitySearch> specialsugg = [
    SpecialitySearch(1, 'MBBS'),
    SpecialitySearch(2, 'MS'),
    SpecialitySearch(3, 'BDS'),
    SpecialitySearch(4, 'Cardiologist'),
    SpecialitySearch(5, 'ENT'),
    SpecialitySearch(6, 'Ophthalmologist'),
    SpecialitySearch(7, 'Gynecologist'),
  ];
  List<CitySearch> suggestions = [
    new CitySearch(1, "Delhi"),
    new CitySearch(2, "Mumbai"),
    new CitySearch(3, "Pune"),
    new CitySearch(4, "Maharashtra"),
    new CitySearch(5, "Gujrat"),
    new CitySearch(6, "Goa"),
    new CitySearch(7, "Hyderabad"),
    new CitySearch(8, "Nodia"),
    new CitySearch(8, "Nanital"),
    new CitySearch(9, "Solan"),
    new CitySearch(10, "Masoori"),
    new CitySearch(12, "Gurgaon"),
    new CitySearch(13, "Bihar"),
    new CitySearch(14, "Rohtak"),
    new CitySearch(15, "Saharanpur"),
    new CitySearch(16, "Badort"),
    new CitySearch(17, "Manali")
  ];
  GlobalKey key = new GlobalKey<AutoCompleteTextFieldState<CitySearch>>();
  GlobalKey lkey =
      new GlobalKey<AutoCompleteTextFieldState<SpecialitySearch>>();
  GlobalKey ekey = new GlobalKey<AutoCompleteTextFieldState<LocalitySearch>>();

  AutoCompleteTextField<CitySearch> cityTextField;
  AutoCompleteTextField<SpecialitySearch> specialityTextField;
  AutoCompleteTextField<LocalitySearch> educationTextField;

  CitySearch selected;
  LocalitySearch eselected;
  SpecialitySearch sselected;

  String city = '';
  String gender = '';
  String speciality = '';
  String email = '';
  String fullname = '';
  String experience = '';
  List<String> education = [''];
  bool _autoValidate = false;
  bool isSelected = false;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String validateName(String value) {
    if (value.length < 3)
      return 'Please enter a valid name';
    else
      return null;
  }

  String validateExperience(String value) {
    if (value.isEmpty)
      return 'Please enter a valid name';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
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
        title: new Text('Create Profile'),
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
                            icon: Icon(Icons.person),
                            hintText: 'Enter your name',
                            labelText: 'Name',
                          ),
                          validator: validateName,
                          onSaved: (String value) {
                            fullname = value;
                          }),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: new InputDecoration(
                            icon: Icon(Icons.mail),
                            hintText: 'Enter email address',
                            labelText: 'Email',
                          ),
                          validator: validateName,
                          onSaved: (String value) {
                            email = value;
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 15),
                        child: selected == null
                            ? cityTextField
                            : Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_city,
                                            color: grey,
                                          ),
                                          SizedBox(
                                            width: 12.0,
                                          ),
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
                        padding: const EdgeInsets.only(top: 20, right: 15),
                        child: sselected == null
                            ? specialityTextField
                            : Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.assignment_ind,
                                            color: grey,
                                          ),
                                          SizedBox(width: 12.0),
                                          Text(
                                            sselected.name,
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
                                              sselected = null;
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
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.people,
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.grey.shade600,
                              ),
                              SizedBox(
                                width: 17.0,
                              ),
                              Text(
                                'Gender',
                                style: TextStyle(
                                    color: isSelected
                                        ? Colors.blue
                                        : Colors.grey.shade600,
                                    fontSize: 16),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                groupValue: gender,
                                value: 'male',
                                onChanged: (val) {
                                  setState(() {
                                    gender = val;
                                    isSelected = true;
                                  });
                                },
                              ),
                              new Text('Male'),
                              Radio(
                                groupValue: gender,
                                value: 'female',
                                onChanged: (val) {
                                  setState(() {
                                    gender = val;
                                    isSelected = true;
                                  });
                                },
                              ),
                              new Text('Female'),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 15),
                        child: eselected == null
                            ? educationTextField
                            : Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Icon(
                                            Icons.book,
                                            color: grey,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            eselected.name,
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
                                              eselected = null;
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
                      new TextFormField(
                          decoration: new InputDecoration(
                            icon: Icon(Icons.receipt),
                            labelText: 'Registration Details',
                            suffixIcon: Icon(Icons.arrow_forward),
                          ),
                          onTap: () {
                            //changeScreen(context, RegistrationDetails());
                          },
                          onSaved: (String value) {
                            //code left
                          }),
                      new TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            icon: Icon(Icons.school),
                            hintText: 'Your Experience',
                            labelText: 'Years of Experience',
                          ),
                          validator: validateExperience,
                          onSaved: (String value) {
                            experience = value;
                          }),
                    ],
                  ),
                ),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Continue',
                      style: new TextStyle(color: Colors.white),
                    ),

                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print(fullname +
                            email +
                            selected.name +
                            sselected.name +
                            gender +
                            experience.toString());

                        // bool isval = await updateDoctor(fullname, email,
                        //     selected.name, sselected.name, gender, experience);
                        // if (isval) {

                        //   Navigator.pop(context);
                        // }
                      } 
                      // else {
                      //   setState(() {
                      //     _autoValidate = true;
                      //   });
                      // }
                    },
                    color: Colors.deepOrangeAccent,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }
}

class SpecialitySearch {
  int id;
  String name;
  SpecialitySearch(this.id, this.name);
}
