class DoctorModel {
  int? doctorId;
  String? doctorName;
  String? doctorSurname;
  String? doctorTelNumber;
  String? doctorEmail;
  String? workTimeFrom;
  String? workTimeTo;
  String? password;
  bool? status;
  String? activationCode; // int?
  String? username;
  String? address;
  String? latitude;
  String? longitude;
  int? distance; // double?
  num? rating;
  int? peopleCount;
  String? about; // ?
  String? qualifications; // ?
  int? experience;
  int? fees;
  List<Specialties>? specialties;

  DoctorModel(
      {this.doctorId,
      this.doctorName,
      this.doctorSurname,
      this.doctorTelNumber,
      this.doctorEmail,
      this.workTimeFrom,
      this.workTimeTo,
      this.password,
      this.status,
      this.activationCode,
      this.username,
      this.address,
      this.latitude,
      this.longitude,
      this.distance,
      this.rating,
      this.peopleCount,
      this.about,
      this.qualifications,
      this.experience,
      this.fees,
      this.specialties});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctorId'];
    doctorName = json['doctorName'];
    doctorSurname = json['doctorSurname'];
    doctorTelNumber = json['doctorTelNumber'];
    doctorEmail = json['doctorEmail'];
    workTimeFrom = json['workTimeFrom'];
    workTimeTo = json['workTimeTo'];
    password = json['password'];
    status = json['status'];
    activationCode = json['activationCode'];
    username = json['username'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distance = json['distance'];
    rating = json['rating'];
    peopleCount = json['peopleCount'];
    about = json['about'];
    qualifications = json['qualifications'];
    experience = json['experience'];
    fees = json['fees'];
    if (json['specialties'] != null) {
      specialties = <Specialties>[];
      json['specialties'].forEach((v) {
        specialties!.add(new Specialties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctorId'] = this.doctorId;
    data['doctorName'] = this.doctorName;
    data['doctorSurname'] = this.doctorSurname;
    data['doctorTelNumber'] = this.doctorTelNumber;
    data['doctorEmail'] = this.doctorEmail;
    data['workTimeFrom'] = this.workTimeFrom;
    data['workTimeTo'] = this.workTimeTo;
    data['password'] = this.password;
    data['status'] = this.status;
    data['activationCode'] = this.activationCode;
    data['username'] = this.username;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['distance'] = this.distance;
    data['rating'] = this.rating;
    data['peopleCount'] = this.peopleCount;
    data['about'] = this.about;
    data['qualifications'] = this.qualifications;
    data['experience'] = this.experience;
    data['fees'] = this.fees;
    if (this.specialties != null) {
      data['specialties'] = this.specialties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specialties {
  int? specialtyId;
  String? specialtyName;

  Specialties({this.specialtyId, this.specialtyName});

  Specialties.fromJson(Map<String, dynamic> json) {
    specialtyId = json['specialtyId'];
    specialtyName = json['specialtyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['specialtyId'] = this.specialtyId;
    data['specialtyName'] = this.specialtyName;
    return data;
  }
}
