import 'dart:convert';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Models/Appointments/BriefHistoryMode.dart';
import 'package:getcure_doctor/Models/ClinicDoctorModel.dart';
import 'package:getcure_doctor/Models/DoctorLogin.dart';
import 'package:getcure_doctor/Models/TokenMode.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Apis.dart';
import 'package:intl/intl.dart';

Future<bool> loginDoctor(mobNo, pass) async {
  var response = await http
      .post(LOGINDOCTOR, body: {"emailOrPhone": mobNo, "password": pass});
  print(response.body);
  print(response.statusCode);
  if (response.statusCode == 200) {
    DoctorLogin doctor = DoctorLogin.fromJson(json.decode(response.body));
    SharedPreferences pref = await SharedPreferences.getInstance();
    // print(doctor.token.toString());
    pref.setString('docToken', doctor.token);
    pref.setString('dresponse', json.encode(doctor));
    pref.setString('docId', doctor.data.id.toString());
    return true;
  }
  return false;
}

// Future<String> clinicDoctors() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   String token = pref.getString('docToken');
//   var response =
//       await http.get(MYCLINICS + '/1', headers: {'Authorization': token});
//   print("Clinic doctor = " + response.statusCode.toString());
//   if (response.statusCode == 200) {
//     ClinicDoctorModel docmodel =
//         ClinicDoctorModel.fromJson(json.decode(response.body));
//     pref.setString('clinicresponse', json.encode(docmodel));
//     return response.body;
//   }
// }

Future<List<String>> getBriefHistories() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = pref.getString('docToken');
  var response =
      await http.get(BRIEFHISTORY, headers: {"Authorization": token});
  print("hello");
  print(response.body);
  BriefHistoryModel brief =
      BriefHistoryModel.fromJson(jsonDecode(response.body));
  List<String> data = [];
  for (var x in brief.data) {
    data.add(x.title);
  }
  print(data);
  // if (data.length > 0) {
  return data;
  // }
}

Future<List<String>> getVisitReason() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = pref.getString('docToken');
  // var response =
  //     await http.get(BRIEFHISTORY, headers: {"Authorization": token});
  //     print("hello");
  // print(response.body);
  // BriefHistoryModel brief =
  //     BriefHistoryModel.fromJson(jsonDecode(response.body));
  // List<String> data = [];
  // for (var x in brief.data) {
  //   data.add(x.title);
  // }
  // print(data);
  // // if (data.length > 0) {
  //   return data;
  // // }
}
Future<String> generateOtp(mobno) async {
  var response = await http.post(OTP, body: {"mobile_no": mobno});
  print(response.body);
  print(response.statusCode);
  if (response.statusCode == 200) {
    return response.body;
  }
  return null;
}

// Future<bool> signupDoctor(mobno, otp, password) async {
//   var response = await http.post(SIGNUP,
//       body: {"mobile_no": mobno, "password": password, "otp": otp});
//   print(response.body);
//   if (response.statusCode == 200) {
//     DoctorUser doctor = DoctorUser.fromJson(json.decode(response.body));
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setString('token', doctor.token);
//     pref.setString('dresponse', json.encode(doctor));
//     return true;
//   } else {
//     return false;
//   }
// }

// Future<bool> updateDoctor(
//     name, email, city, speciality, gender, yearexp) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();

//   String token = prefs.getString('token');
//   var response = await http.put(UPDATEDOCTOR, headers: {
//     "Authorization": token
//   }, body: {
//     "name": name,
//     "email": email,
//     "gender": gender.toLowerCase(),
//     "experience": yearexp,
//     "speciality": speciality
//   });
//   print(response.body);
//   if (response.statusCode == 200) {
//     return true;
//   } else {
//     return false;
//   }
// }

// Future<bool> login(url, mobno, password) async {
//   var response =
//       await http.post(url, body: {"emailOrPhone": mobno, "password": password});
//   print(response.body);
//   if (response.statusCode == 200) {
//     DoctorUser doctor = DoctorUser.fromJson(json.decode(response.body));
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setString('dtoken', doctor.token);
//     pref.setString('dresponse', json.encode(doctor));
//     return true;
//   } else {
//     return false;
//   }
// }

// Future<String> loginError(url, mobno, password) async {
//   var response =
//       await http.post(url, body: {"emailOrPhone": mobno, "password": password});
//   print(response.body);
//   if (response.statusCode == 200) {
//     if (url == LOGINDOCTOR) {
//       DoctorUser doctor = DoctorUser.fromJson(json.decode(response.body));
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       pref.setString('token', doctor.token);
//       pref.setString('dresponse', json.encode(doctor));
//     } else {
//       FrontDeskUser frontDeskUser =
//           FrontDeskUser.fromJson(json.decode(response.body));
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       pref.setString('token', frontDeskUser.token);
//       pref.setString('fresponse', json.encode(frontDeskUser));
//     }
//     return response.body;
//   }
// }

// Future<bool> addClinic(
//     clinicName, cityId, cityName, emergencyFees, consultFees, address, timings, phoneNo) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String token = prefs.getString('token');
//   var response = await http.post(ADDCLINIC, headers: {
//     "Authorization": token
//   }, body: json.encode(
//     {
//       "name": clinicName,
//       "city_id": cityId.toString(),
//       "city": cityName,
//       "address": address,
//       "landmark":null,
//       "pin_code":null,
//       "phone_no": phoneNo,
//       "timings":timings.toString(),
//       "emergency_fee": emergencyFees.toString(),
//       "consultaion_fee": consultFees.toString(),
//     }),
//   );
//   print(response.body);
//   print(response.statusCode);
//   if (response.statusCode == 200) {
//     return true;
//   } else {
//     return false;
//   }
// }

Future<String> bookToken(name, age, mobileno, address, vtype, atype, tno, ttime,
    tdate, btype, docid, gender) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token');
  var response = await http.post(TOKENSBOOKING, headers: {
    "Authorization": token
  }, body: {
    "patient[name]": name,
    "patient[age]": age.toString(),
    "patient[gender]": gender,
    "patient[address]": address,
    "patient[mobile_no]": mobileno.toString(),
    "visit_type": vtype,
    "booking_type": btype,
    "appointment_type": atype,
    "date": DateFormat('yyyy-MM-dd').format(tdate).toString(),
    "time": DateFormat.Hms().format(tdate).toString(),
    "token_no": tno.toString(),
    "clinic_doctor_id": docid.toString(),
    "is_present": 'true'
  });
  print(response.body);
  if (response.statusCode == 200) {
    return json.decode(response.body)["data"]["patient_id"];
  } else {
    return 'NIL';
  }
}

Future<void> getTokens(date, TokenDB db) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token');
  String docId = prefs.getString('docId');
  var response = await http.get(
    GETTOKENSBYDATE +
        docId +
        "?${DateFormat('yyyy-MM-dd').format(date).toString()}",
    headers: {"Authorization": token},
  );
  print(response.body);
  if (response.statusCode == 200) {
    TokenModel tokens = TokenModel.fromJson(json.decode(response.body));
    for (final i in tokens.data) {
      final token = Token(
          doctorid: i.clinicDoctorId,
          booked: true,
          name: i.patientName,
          tokentime: DateTime.parse(
              DateFormat("yyyy-MM-dd").format(DateTime.now()) + " " + i.time),
          isOnline: true,
          tokenno: i.tokenNo,
          address: i.patient.address,
          age: i.patient.age,
          fees: 100,
          appointmenttype: i.appointmentType,
          bookedtype: i.bookingType,
          updatedAt: DateTime.now(),
          mobileno: int.parse(i.patient.mobileNo),
          visittype: i.visitType,
          guid: i.patientId,
          cancelled: false);
      db.updateOnline(token);
    }
  }
}
