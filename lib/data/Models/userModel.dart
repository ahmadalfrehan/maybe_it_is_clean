import 'package:lujain/data/Models/AddressModel.dart';
import 'package:lujain/data/Models/CompanyModel.dart';
import 'package:lujain/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.username,
    required super.name,
    required super.email,
    required super.website,
    required super.address,
    required super.phone,
    required super.company,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
      website: json['website'],
      address: AddressModel.fromJson(json['address']),
      phone: json['phone'],
      company: CompanyModel.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'email': email,
      'website': website,
      'address': address,
      'phone': phone,
      'company': company,
    };
  }
}
