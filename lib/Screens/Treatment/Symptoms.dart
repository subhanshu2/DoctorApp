import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Models/addItemmodel.dart';
import 'package:getcure_doctor/Widgets/SearchBar.dart';
// import 'package:getcure_doctor/Provider/UserProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';

class Symtoms extends StatefulWidget {
  final Token token;
  Symtoms({Key key, this.token}) : super(key: key);

  @override
  _SymtomsState createState() => _SymtomsState();
}

class _SymtomsState extends State<Symtoms> {
  List<AddItemsDoctor> _briefhistory;
  List<AddItemsDoctor> _todayVisit;
  String dropdownValue = '1';
  var imageUrl;
  bool isloading = false;
  bool showResponse = false;
  String error = '';
  final picker = ImagePicker();

  String query = '';
  Future uploadImage() async {
    const url = "";
    var image = await picker.getImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        isloading = true;
      });
    }

    if (image != null) {
      FormData formData = new FormData.fromMap({
        "file": await MultipartFile.fromFile(
          image.path,
          contentType: new MediaType("image", "jpg"),
        ),
        // "upload_preset": "project78",
        // "cloud_name": "dcsqiv7je",
      });
      try {
        Response response = await Dio().post(url, data: formData);
        var data = jsonDecode(response.toString());
        print(response.data);
        print(data['secure_url']);

        setState(() {
          isloading = false;
          imageUrl = data['secure_url'];
          print(imageUrl);
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    _briefhistory = [];
    _todayVisit = [];
    super.initState();
  }

  @override
  void dispose() {
    _briefhistory.clear();
    _todayVisit.clear();
    super.dispose();
  }

  // Future<SymptomsModel> fetchBriefHistoryList() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString('token');
  //   final response = await http.get(
  //     GETBRIEFHISTORY,
  //     headers: {"Authorization": token},
  //   );
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     SymptomsModel briefHistory =
  //         SymptomsModel.fromJson(json.decode(response.body));
  //     return briefHistory;
  //   } else {
  //     throw Exception('Unable to fetch invoice');
  //   }
  // }

  // void getlist() async {
  //  SymptomsModel mod = await fetchBriefHistoryList();
  //   for (int index = 0; index < mod.data.length; index++)
  //     _selectedAddItemsDoctors[index].name = mod.data[index].values;
  // }

  @override
  Widget build(BuildContext context) {
    final patient = Provider.of<PatientsVisitDB>(context);

    return SingleChildScrollView(
        child:
            // Consumer<DoctorProvider>(builder: (context, doctorprovider, child) {
            Center(
                child: Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ExpansionTile(
                    title: Text('Brief History'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.local_hospital,
                          color: orange,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SearchBar(pId: widget.token.guid);
                            },
                          );
                        }),
                    children: [
                      StreamBuilder(
                        stream: patient.getBriefHistory(widget.token.guid),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<PatientsVisitData>> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return CircularProgressIndicator();
                              break;
                            default:
                              return ListView.builder(
                                itemCount: snapshot.data[0].briefHistory == null
                                    ? 0
                                    : snapshot.data[0].briefHistory.data.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(snapshot.data[0].briefHistory
                                        .data[index].title),
                                    trailing: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          patient.deleteBrief(
                                              snapshot.data[0],
                                              snapshot.data[0].briefHistory
                                                  .data[index].title);
                                        }),
                                  );
                                },
                              );

                              break;
                            // default:
                            //   return Text('NO Data');
                            //   break;
                          }
                        },
                      ),
                    ]),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ExpansionTile(
                    title: Text('Todays visit Reason'),
                    children: [
                      for (int i = 0; i < _todayVisit.length; i++)
                        Container(
                          child: ListTile(
                            title: Text(_todayVisit[i].name),
                          ),
                        ),
                    ]),
              ),
              IconButton(
                  icon: Icon(
                    Icons.local_hospital,
                    color: orange,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: AlertDialog(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(child: Text('Todays visit Reason')),
                                InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: Icon(Icons.close))
                              ],
                            ),
                            actions: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FlutterTagging<AddItemsDoctor>(
                                        initialItems: _todayVisit,
                                        textFieldConfiguration:
                                            TextFieldConfiguration(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor:
                                                Colors.green.withAlpha(30),
                                            hintText: 'Search Disease',
                                            labelText: 'Select Disease',
                                          ),
                                        ),
                                        findSuggestions: AddItemsDoctorService
                                            .getAddItemsDoctors,
                                        additionCallback: (value) {
                                          return AddItemsDoctor(
                                            name: value,
                                          );
                                        },
                                        onAdded: (addItemsDoctor) {
                                          // api calls here, triggered when add to tag button is pressed
                                          return AddItemsDoctor();
                                        },
                                        configureSuggestion: (lang) {
                                          return SuggestionConfiguration(
                                            title: Text(lang.name),
                                            additionWidget: Chip(
                                              avatar: IconButton(
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _todayVisit.add(lang);
                                                  });
                                                },
                                              ),
                                              label: Text('Add New Tag'),
                                              labelStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                        },
                                        configureChip: (lang) {
                                          return ChipConfiguration(
                                            label: Text(lang.name),
                                            backgroundColor: Colors.green,
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            deleteIconColor: Colors.white,
                                          );
                                        },
                                        onChanged: () {
                                          setState(() {
                                            _todayVisit
                                                .map<String>(
                                                    (lang) => lang.name)
                                                .toString();
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    // Expanded(
                                    //   child: SyntaxView(
                                    //     code: _todayVisit[0].name
                                    //         .selectedValuesJsonVisit,
                                    //     syntax: Syntax.JAVASCRIPT,
                                    //     withLinesCount: false,
                                    //     syntaxTheme: SyntaxTheme.standard(),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ],
    )));
  }
}
