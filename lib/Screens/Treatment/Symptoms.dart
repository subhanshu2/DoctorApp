import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:getcure_doctor/Database/PatientsVisitTable.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Models/addItemmodel.dart';
import 'package:getcure_doctor/Widgets/FeedBackScreen.dart';
import 'package:getcure_doctor/Widgets/SearchAllergy.dart';
import 'package:getcure_doctor/Widgets/SearchBar.dart';
import 'package:getcure_doctor/Widgets/SearchLifeStyle.dart';
import 'package:getcure_doctor/Widgets/searchBarVisit.dart';
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
        child: Center(
            child: Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ExpansionTile(
                    leading: Text('Brief History'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.local_hospital,
                          color: orange,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SearchBar(
                                  pId: widget.token.guid,
                                  docId: widget.token.doctorid);
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
                                physics: ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    dense: true,
                                    title: Text(snapshot.data[0].briefHistory
                                        .data[index].title),
                                    subtitle: Text(
                                        "${snapshot.data[0].briefHistory.data[index].isCured == true ? "Cured" : "Since"} (${snapshot.data[0].briefHistory.data[index].date})"),
                                    trailing: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          patient.deleteBrief(
                                              snapshot.data[0],
                                              snapshot.data[0].briefHistory
                                                  .data[index].title);
                                          patient.deleteDiagnosis(
                                              snapshot.data[0],
                                              snapshot.data[0].diagnosis
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
                    leading: Text("Today's Visit Reasons"),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.local_hospital,
                          color: orange,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SearchBarVisit(
                                pId: widget.token.guid,
                                docId: widget.token.doctorid,
                              );
                            },
                          );
                        }),
                    children: [
                      StreamBuilder(
                        stream: patient.getVisitReason(widget.token.guid),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<PatientsVisitData>> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return CircularProgressIndicator();
                              break;
                            default:
                              return ListView.builder(
                                itemCount: snapshot.data[0].visitReason == null
                                    ? 0
                                    : snapshot.data[0].visitReason.data.length,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    title: Text(snapshot
                                        .data[0].visitReason.data[index].title),
                                    trailing: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          patient.deleteVisit(
                                              snapshot.data[0],
                                              snapshot.data[0].visitReason
                                                  .data[index].title);
                                        }),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return FeedBackScreen(
                                              token: widget.token,
                                              pat: snapshot.data[0]);
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                              break;
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
                    leading: Text("Allergies"),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.local_hospital,
                          color: orange,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SearchAllergy(
                                pId: widget.token.guid,
                                docId: widget.token.doctorid,
                              );
                            },
                          );
                        }),
                    children: [
                      StreamBuilder(
                        stream: patient.getAllergies(widget.token.guid),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<PatientsVisitData>> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return CircularProgressIndicator();
                              break;
                            default:
                              return ListView.builder(
                                itemCount: snapshot.data[0].allergies == null
                                    ? 0
                                    : snapshot.data[0].allergies.data.length,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(snapshot
                                        .data[0].allergies.data[index].title),
                                    trailing: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          patient.deleteallergy(
                                              snapshot.data[0],
                                              snapshot.data[0].allergies
                                                  .data[index].title);
                                        }),
                                  );
                                },
                              );

                              break;
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
                    leading: Text("LifeStyle"),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.local_hospital,
                          color: orange,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SearchLifeStyle(
                                pId: widget.token.guid,
                                docId: widget.token.doctorid,
                              );
                            },
                          );
                        }),
                    children: [
                      StreamBuilder(
                        stream: patient.getLifeStyle(widget.token.guid),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<PatientsVisitData>> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return CircularProgressIndicator();
                              break;
                            default:
                              return ListView.builder(
                                itemCount: snapshot.data[0].lifestyle == null
                                    ? 0
                                    : snapshot.data[0].lifestyle.data.length,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(snapshot
                                        .data[0].lifestyle.data[index].title),
                                    trailing: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          patient.deleteLifeStyle(
                                              snapshot.data[0],
                                              snapshot.data[0].lifestyle
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
      ],
    )));
  }
}
