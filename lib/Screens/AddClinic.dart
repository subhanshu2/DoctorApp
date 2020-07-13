import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:getcure_doctor/Helpers/colors.dart';
import 'package:intl/intl.dart';

class AddClinic extends StatefulWidget {
  AddClinic({Key key}) : super(key: key);

  @override
  _AddClinicState createState() => _AddClinicState();
}

class _AddClinicState extends State<AddClinic> {
  String startTime;
  String endTime;
  _AddClinicState() {
    cityTextField = new AutoCompleteTextField<CitySearch>(
      decoration: new InputDecoration(
          hintText: "City", suffixIcon: new Icon(Icons.search)),
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
    localityTextField = new AutoCompleteTextField<LocalitySearch>(
      decoration: new InputDecoration(
          hintText: "Locality", suffixIcon: new Icon(Icons.search)),
      itemSubmitted: (item) => setState(() => lselected = item),
      key: lkey,
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
  GlobalKey lkey = new GlobalKey<AutoCompleteTextFieldState<LocalitySearch>>();

  AutoCompleteTextField<CitySearch> cityTextField;
  AutoCompleteTextField<LocalitySearch> localityTextField;

  CitySearch selected;

  LocalitySearch lselected;

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
        title: new Text('VISITING CLINIC'),
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15.0),
              child: TextFormField(
                enableSuggestions: true,
                decoration: InputDecoration(
                  labelText: 'Clinic Name',
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please provide clinic name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15.0),
              child: selected == null
                  ? cityTextField
                  : Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              selected.name,
                              style: TextStyle(fontSize: 15),
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
                        Divider(
                          color: black,
                        ),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15.0),
              child: lselected == null
                  ? localityTextField
                  : Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              lselected.name,
                              style: TextStyle(fontSize: 15),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    lselected = null;
                                  });
                                })
                          ],
                        ),
                        Divider(
                          color: black,
                        ),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15.0),
              child: TextFormField(
                enableSuggestions: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Clinic Number',
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please provide clinic name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15.0),
              child: TextFormField(
                enableSuggestions: true,
                keyboardType: TextInputType.text,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Clinic Address',
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please provide clinic name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Clinic Timing',
                        style: TextStyle(color: grey, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                DatePicker.showTimePicker(context,
                                    showTitleActions: true, onChanged: (date) {
                                  print('change $date in time zone ' +
                                      date.timeZoneOffset.inHours.toString());
                                }, onConfirm: (date) {
                                  print('confirm $date');
                                  setState(() {
                                    startTime = DateFormat('HH:mm:ss')
                                        .format(date)
                                        .toString();
                                  });
                                }, currentTime: DateTime.now());
                              },
                              child: Text(
                                'Opening time',
                                style: TextStyle(color: grey),
                              )),
                          startTime == null
                              ? Text('data')
                              : Text(startTime.toString()),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                DatePicker.showTimePicker(context,
                                    showTitleActions: true, onChanged: (date) {
                                  print('change $date in time zone ' +
                                      date.timeZoneOffset.inHours.toString());
                                }, onConfirm: (date) {
                                  print('confirm $date');
                                  setState(() {
                                    endTime = DateFormat('HH:mm:ss')
                                        .format(date)
                                        .toString();
                                  });
                                }, currentTime: DateTime.now());
                              },
                              child: Text(
                                'Closing time',
                                style: TextStyle(color: grey),
                              )),
                          endTime == null ? Text('') : Text(endTime.toString())
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
      floatingActionButton: FlatButton(
          color: orangep,
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Save',
            style: TextStyle(color: white),
          )),
    );
  }
}

class CitySearch {
  int id;
  String name;
  CitySearch(this.id, this.name);
}

class LocalitySearch {
  int id;
  String name;
  LocalitySearch(this.id, this.name);
}
