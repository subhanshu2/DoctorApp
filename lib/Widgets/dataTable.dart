import 'package:getcure_doctor/Helpers/AppConfig/GetBigggerData.dart';
import 'package:getcure_doctor/Helpers/AppConfig/colors.dart';
import 'package:getcure_doctor/Widgets/updatebooking.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TokenTable extends StatefulWidget {
  final Function count;
  final String query;
  const TokenTable({Key key, this.count, this.query}) : super(key: key);
  @override
  _TokenTableState createState() => _TokenTableState();
}

class _TokenTableState extends State<TokenTable> {
  bool sort;
  @override
  void initState() {
    super.initState();
    sort = false;
  }

  List/*<Token>*/ li = [];
  @override
  Widget build(BuildContext context) {
//    final database = Provider.of<TokenDB>(context);
    return StreamBuilder(
    //    stream: database.watchAllTasks(widget.query),
        builder: (context, AsyncSnapshot<List/*<Token>*/> list) {
          li = list.data;
          // onSort(int columnIndex, bool ascending, List<Token> token) {
          //   if (columnIndex == 1) {
          //     if (ascending) {
          //       li.sort((a, b) => a.name.compareTo(b.name));
          //     } else {
          //       li.sort((a, b) => b.name.compareTo(a.name));
          //     }
          //   }
          // }

          if (list.data != null) {
            return Container(
              height: 300,
              child: SingleChildScrollView(
                child: DataTable(
                    sortColumnIndex: 1,
                    sortAscending: sort,
                    columnSpacing: 8,
                    horizontalMargin: 5,
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text('T.no.'),
                      ),
                      DataColumn(
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            sort = !sort;
                          });
                          //onSort(columnIndex, ascending, li);
                        },
                        label: Text('Patients Name'),
                      ),
                      DataColumn(label: Text('Address')),
                      DataColumn(label: Text('Type')),
                      DataColumn(label: Text('UGID')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Time')),
                      DataColumn(label: Text('Visit')),
                      DataColumn(label: Text('canceled'))
                    ],
                    rows: li
                        .map((p) => DataRow(cells: [
                              DataCell(Text(p.tokenno.toString()),
                                  onTap: () {}),
                              DataCell(
                                  Text(p.name,
                                      style: TextStyle(
                                          color: (p.isOnline)
                                              ? (green)
                                              : (p.cancelled == (true)
                                                  ? (grey)
                                                  : (p.appointmenttype ==
                                                          ('emergency')
                                                      ? (red)
                                                      : (p.bookedtype ==
                                                              ('on call')
                                                          ? orangef
                                                          : blueGrey))))),
                                  onTap: () => p.cancelled == false
                                      ? showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              UpdateBooking(
                                                id: p.id,
                                                time: p.tokentime,
                                               // token: p,
                                                tokenno: p.tokenno,
                                                initialName: p.name,
                                                initialAge: p.age.toString(),
                                                initialAddress: p.address,
                                                initialMob:
                                                    p.mobileno.toString(),
                                                initialAppointmentType:
                                                    p.appointmenttype,
                                                initialBookigType: p.bookedtype,
                                                visitType: p.visittype,
                                                gender: p.gender,
                                                counter: widget.count,
                                                docId: p.doctorid,
                                              ))
                                      : {print('false')}),
                              DataCell(
                                  GetBiggerData(
                                      p.address,
                                      (p.isOnline)
                                          ? (green)
                                          : (p.cancelled == (true)
                                              ? (grey)
                                              : (p.appointmenttype ==
                                                      ('emergency')
                                                  ? (red)
                                                  : (p.bookedtype == ('on call')
                                                      ? orangef
                                                      : blueGrey)))),
                                  onTap: () {}),
                              DataCell(Text(
                                p.appointmenttype,
                                style: TextStyle(
                                    color: (p.isOnline)
                                        ? (green)
                                        : (p.cancelled == (true)
                                            ? (grey)
                                            : (p.appointmenttype ==
                                                    ('emergency')
                                                ? (red)
                                                : (p.bookedtype == ('on call')
                                                    ? orangef
                                                    : blueGrey)))),
                              )),
                              DataCell(Text(
                                p.guid == null ? '-NIL-' : p.guid.toString(),
                                style: TextStyle(
                                    color: (p.isOnline)
                                        ? (green)
                                        : (p.cancelled == (true)
                                            ? (grey)
                                            : (p.appointmenttype ==
                                                    ('emergency')
                                                ? (red)
                                                : (p.bookedtype == ('on call')
                                                    ? orangef
                                                    : blueGrey)))),
                              )),
                              DataCell(
                                  Text(
                                    DateFormat("dd-MM-yyyy")
                                        .format(p.tokentime)
                                        .toString(),
                                    style: TextStyle(
                                        color: (p.isOnline)
                                            ? (green)
                                            : (p.cancelled == (true)
                                                ? (grey)
                                                : (p.appointmenttype ==
                                                        ('emergency')
                                                    ? (red)
                                                    : (p.bookedtype ==
                                                            ('on call')
                                                        ? orangef
                                                        : blueGrey)))),
                                  ),
                                  onTap: () {}),
                              DataCell(
                                  Text(
                                    DateFormat.jm()
                                        .format(p.tokentime)
                                        .toString(),
                                    style: TextStyle(
                                        color: (p.isOnline)
                                            ? (green)
                                            : (p.cancelled == (true)
                                                ? (grey)
                                                : (p.appointmenttype ==
                                                        ('emergency')
                                                    ? (red)
                                                    : (p.bookedtype ==
                                                            ('on call')
                                                        ? orangef
                                                        : blueGrey)))),
                                  ),
                                  onTap: () {}),
                              DataCell(Text(
                                p.visittype,
                                style: TextStyle(
                                    color: (p.cancelled == (true)
                                        ? (grey)
                                        : (p.appointmenttype == ('emergency')
                                            ? (red)
                                            : (p.bookedtype == ('on call')
                                                ? orangef
                                                : blueGrey)))),
                              )),
                              DataCell(
                                Text(
                                  p.cancelled.toString(),
                                  style: TextStyle(
                                      color: (p.cancelled == (true)
                                          ? (grey)
                                          : (p.appointmenttype == ('emergency')
                                              ? (red)
                                              : (p.bookedtype == ('on call')
                                                  ? orangef
                                                  : blueGrey)))),
                                ),
                              ),
                            ]))
                        .toList()),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class DrInvoiceTable extends StatefulWidget {
  //final Future<DoctorInvoiceModel>  fetchinvoice;
  //const DrInvoiceTable({Key key, this.fetchinvoice}) : super(key: key);

  @override
  _DrInvoiceTableState createState() => _DrInvoiceTableState();
}

class _DrInvoiceTableState extends State<DrInvoiceTable> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    //  future: widget.fetchinvoice,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          return Container(
            padding: EdgeInsets.only(bottom: 10.0),
            height: 300,
            child: SingleChildScrollView(
              child: DataTable(columnSpacing: 8, horizontalMargin: 5, columns: <
                  DataColumn>[
                DataColumn(
                  label: Text('Date'),
                ),
                DataColumn(label: Text('New Visit')),
                DataColumn(label: Text('Follow Up')),
                DataColumn(label: Text('Emergency')),
                DataColumn(label: Text('Total Appointment')),
                DataColumn(label: Text('Dr Fee')),
              ], rows: <DataRow>[
                for (int i = 0; i < snapshot.data.data.length; i++)
                  DataRow(
                    cells: [
                      DataCell(
                        Text(snapshot.data.data[i].date),
                      ),
                      DataCell(
                        Text(snapshot.data.data[i].newVisits.toString()),
                      ),
                      DataCell(
                        Text(snapshot.data.data[i].followUps.toString()),
                      ),
                      DataCell(
                        Text(snapshot.data.data[i].emergencies.toString()),
                      ),
                      DataCell(
                        Text(
                            snapshot.data.data[i].totalAppointments.toString()),
                      ),
                      DataCell(
                        Text(snapshot.data.data[i].feesCollected.toString()),
                      ),
                    ],
                  ),
              ]),
            ),
          );
        }
      },
    );
  }
}

class HopitalInvoiceTable extends StatefulWidget {
  //final Future<HospitalInvoiceModel>  fetchHospinvoice;
  //HopitalInvoiceTable({Key key,this.fetchHospinvoice}) : super(key: key);

  @override
  _HopitalInvoiceTableState createState() => _HopitalInvoiceTableState();
}

class _HopitalInvoiceTableState extends State<HopitalInvoiceTable> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    //  future: widget.fetchHospinvoice,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          return Container(
            height: 300,
            child: SingleChildScrollView(
              child: DataTable(columnSpacing: 8, horizontalMargin: 5, columns: <
                  DataColumn>[
                DataColumn(label: Text("Doctor's Name")),
                DataColumn(label: Text('New Visit')),
                DataColumn(label: Text('Follow Up')),
                DataColumn(label: Text('Emgy')),
                DataColumn(label: Text('Total Appointment')),
                DataColumn(label: Text('Coolected Dr. Fee')),
              ], rows: <DataRow>[
                for (int i = 0; i < snapshot.data.data.length; i++)
                  DataRow(
                    cells: [
                      DataCell(
                        Text('Dr. ' +snapshot.data.data[i].doctorName),
                      ),
                      DataCell(
                        Text(snapshot.data.data[i].newVisits.toString()),
                      ),
                      DataCell(
                        Text(snapshot.data.data[i].followUps.toString()),
                      ),
                      DataCell(
                        Text(snapshot.data.data[i].emergencies.toString()),
                      ),
                      DataCell(
                        Text(
                            snapshot.data.data[i].totalAppointments.toString()),
                      ),
                      DataCell(
                        Text(snapshot.data.data[i].feesCollected.toString()),
                      ),
                    ],
                  ),
              ]),
            ),
          );
        }
      },
    );
  }
}
