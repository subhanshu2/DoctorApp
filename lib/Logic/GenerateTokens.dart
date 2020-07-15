import 'package:flutter/cupertino.dart';
import 'package:getcure_doctor/Database/TokenTable.dart';
import 'package:getcure_doctor/Helpers/Network/Requesthttp.dart';

class GeneratedTokens {
  final int doctorid;
  final DateTime date;
  final DateTime starttime;
  final DateTime endtime;
  final DateTime startbreaktime;
  final DateTime endbreaktime;
  final int nfp;
  final int fees;
  GeneratedTokens(
      {this.fees,
      this.doctorid,
      this.date,
      this.starttime,
      this.endtime,
      this.startbreaktime,
      this.endbreaktime,
      this.nfp});
}

class GenerateTokens {
  GeneratedTokens tokens;
  dynamic hours;

  generateToken(BuildContext context, TokenDB database) {
    // if(database.tokens.shift!=null){
    //   hours=(tokens.startbreaktime.hour - tokens.starttime.hour).abs();
    // }else{
    //   hours=(tokens.endbreaktime.hour - tokens.endtime.hour).abs();
    // }
    hours = (tokens.startbreaktime.hour - tokens.starttime.hour).abs() +
        (tokens.endbreaktime.hour - tokens.endtime.hour).abs();
    dynamic interval = int.parse((60 / tokens.nfp).ceil().toString());
    print("Hours of time = " + hours.toString());
    print(interval);
    dynamic st = tokens.starttime;
    for (int i = 1; i <= tokens.nfp * hours; i++) {
      final token = Token(
        fees: tokens.fees,
        tokenno: i,
        doctorid: tokens.doctorid,
        tokentime: st.add(Duration(minutes: interval)),
      );
      st = st.add(Duration(minutes: interval));
      database.insertTask(token);
    }
    getTokens(tokens.date, database);
  }
}
