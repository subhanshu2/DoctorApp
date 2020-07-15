class TokenModel {
  List<TokenData> data;

  TokenModel({this.data});

  TokenModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<TokenData>();
      json['data'].forEach((v) {
        data.add(new TokenData.fromJson(v));
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

class TokenData {
  int id;
  int tokenNo;
  String patientName;
  String patientId;
  String time;
  String date;
  String appointmentType;
  String visitType;
  String bookingType;
  int clinicDoctorId;
  bool isPresent;
  String bookedAt;
  String bookedBy;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  Patient patient;

  TokenData(
      {this.id,
      this.tokenNo,
      this.patientName,
      this.patientId,
      this.time,
      this.date,
      this.appointmentType,
      this.visitType,
      this.bookingType,
      this.clinicDoctorId,
      this.isPresent,
      this.bookedAt,
      this.bookedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.patient});

  TokenData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tokenNo = json['token_no'];
    patientName = json['patient_name'];
    patientId = json['patient_id'];
    time = json['time'];
    date = json['date'];
    appointmentType = json['appointment_type'];
    visitType = json['visit_type'];
    bookingType = json['booking_type'];
    clinicDoctorId = json['clinic_doctor_id'];
    isPresent = json['is_present'];
    bookedAt = json['booked_at'];
    bookedBy = json['booked_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    patient =
        json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token_no'] = this.tokenNo;
    data['patient_name'] = this.patientName;
    data['patient_id'] = this.patientId;
    data['time'] = this.time;
    data['date'] = this.date;
    data['appointment_type'] = this.appointmentType;
    data['visit_type'] = this.visitType;
    data['booking_type'] = this.bookingType;
    data['clinic_doctor_id'] = this.clinicDoctorId;
    data['is_present'] = this.isPresent;
    data['booked_at'] = this.bookedAt;
    data['booked_by'] = this.bookedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.patient != null) {
      data['patient'] = this.patient.toJson();
    }
    return data;
  }
}

class Patient {
  int id;
  String name;
  String patientId;
  String mobileNo;
  int age;
  String gender;
  String address;
  String createdAt;
  String updatedAt;

  Patient(
      {this.id,
      this.name,
      this.patientId,
      this.mobileNo,
      this.age,
      this.gender,
      this.address,
      this.createdAt,
      this.updatedAt});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    patientId = json['patient_id'];
    mobileNo = json['mobile_no'];
    age = json['age'];
    gender = json['gender'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['patient_id'] = this.patientId;
    data['mobile_no'] = this.mobileNo;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
