import 'dart:convert';

import 'package:moor/moor.dart';
//Brief History
class BriefHistorygenerated {
  List<BriefHistoryData> data;

  BriefHistorygenerated({this.data});

  BriefHistorygenerated.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<BriefHistoryData>();
      json['data'].forEach((v) {
        data.add(new BriefHistoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BriefHistoryData {
  String title;
  String date;
  String visibleTill;

  BriefHistoryData({this.title, this.date, this.visibleTill});

  BriefHistoryData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    visibleTill = json['visible_till'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    data['visible_till'] = this.visibleTill;
    return data;
  }
}
class BriefHistoryConverter extends TypeConverter<BriefHistorygenerated, String> {
  const BriefHistoryConverter();
  @override
  BriefHistorygenerated mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return BriefHistorygenerated.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(BriefHistorygenerated value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}

//Medication

class Medicationgenerated {
  List<MedicationData> data;

  Medicationgenerated({this.data});

  Medicationgenerated.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<MedicationData>();
      json['data'].forEach((v) {
        data.add(new MedicationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MedicationData {
  String disease;
  int symptomId;
  List<Medicines> medicines;

  MedicationData({this.disease, this.symptomId, this.medicines});

  MedicationData.fromJson(Map<String, dynamic> json) {
    disease = json['disease'];
    symptomId = json['symptom_id'];
    if (json['medicines'] != null) {
      medicines = new List<Medicines>();
      json['medicines'].forEach((v) {
        medicines.add(new Medicines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disease'] = this.disease;
    data['symptom_id'] = this.symptomId;
    if (this.medicines != null) {
      data['medicines'] = this.medicines.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicines {
  int medicineId;
  String title;
  String timing;
  int days;
  String type;

  Medicines({this.medicineId, this.title, this.timing, this.days, this.type});

  Medicines.fromJson(Map<String, dynamic> json) {
    medicineId = json['medicine_id'];
    title = json['title'];
    timing = json['timing'];
    days = json['days'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medicine_id'] = this.medicineId;
    data['title'] = this.title;
    data['timing'] = this.timing;
    data['days'] = this.days;
    data['type'] = this.type;
    return data;
  }
}

class MedicationConverter extends TypeConverter<Medicationgenerated, String> {
  const MedicationConverter();
  @override
  Medicationgenerated mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Medicationgenerated.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(Medicationgenerated value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}