import 'package:kaz_med/app/data/models/doctor_model.dart';
import 'package:kaz_med/core/network/interfaces/base_network_model.dart';

class ProfileModel extends BaseNetworkModel<ProfileModel> {
  num? customerId;
  String? customerName;
  String? customerSurname;
  String? customerTelNumber;
  String? email;
  String? activationCode;
  String? username;
  String? password;
  String? address;
  bool? status;
  num? rating;
  num? peopleCount;
  String? avatar;
  List<DoctorModel>? doctors;

  ProfileModel(
      {this.customerId,
      this.customerName,
      this.customerSurname,
      this.customerTelNumber,
      this.email,
      this.activationCode,
      this.username,
      this.password,
      this.address,
      this.status,
      this.rating,
      this.peopleCount,
      this.avatar,
      this.doctors});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerSurname = json['customerSurname'];
    customerTelNumber = json['customerTelNumber'];
    email = json['email'];
    activationCode = json['activationCode'];
    username = json['username'];
    password = json['password'];
    address = json['address'];
    status = json['status'];
    rating = json['rating'];
    peopleCount = json['peopleCount'];
    avatar = json['avatar'];
    if (json['doctors'] != null) {
      doctors = <DoctorModel>[];
      json['doctors'].forEach((v) {
        doctors!.add(DoctorModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = customerId;
    data['customerName'] = customerName;
    data['customerSurname'] = customerSurname;
    data['customerTelNumber'] = customerTelNumber;
    data['email'] = email;
    data['activationCode'] = activationCode;
    data['username'] = username;
    data['password'] = password;
    data['address'] = address;
    data['status'] = status;
    data['rating'] = rating;
    data['peopleCount'] = peopleCount;
    data['avatar'] = avatar;
    if (doctors != null) {
      data['doctors'] = doctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  ProfileModel fromJson(Map<String, dynamic> json) {
    return ProfileModel.fromJson(json);
  }
}
