class DoctorLogin {
  String token;
  Data data;

  DoctorLogin({this.token, this.data});

  DoctorLogin.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String email;
  String mobileNo;
  String password;
  Null alternateNo;
  String gender;
  Null university;
  Null experience;
  Null qualification;
  Null imageUrl;
  Null address;
  Null information;
  Null speciality;
  bool isVerified;
  String getCureCode;
  Null identityVerificationUrl;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.name,
      this.email,
      this.mobileNo,
      this.password,
      this.alternateNo,
      this.gender,
      this.university,
      this.experience,
      this.qualification,
      this.imageUrl,
      this.address,
      this.information,
      this.speciality,
      this.isVerified,
      this.getCureCode,
      this.identityVerificationUrl,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    password = json['password'];
    alternateNo = json['alternate_no'];
    gender = json['gender'];
    university = json['university'];
    experience = json['experience'];
    qualification = json['qualification'];
    imageUrl = json['image_url'];
    address = json['address'];
    information = json['information'];
    speciality = json['speciality'];
    isVerified = json['is_verified'];
    getCureCode = json['get_cure_code'];
    identityVerificationUrl = json['identity_verification_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['password'] = this.password;
    data['alternate_no'] = this.alternateNo;
    data['gender'] = this.gender;
    data['university'] = this.university;
    data['experience'] = this.experience;
    data['qualification'] = this.qualification;
    data['image_url'] = this.imageUrl;
    data['address'] = this.address;
    data['information'] = this.information;
    data['speciality'] = this.speciality;
    data['is_verified'] = this.isVerified;
    data['get_cure_code'] = this.getCureCode;
    data['identity_verification_url'] = this.identityVerificationUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
