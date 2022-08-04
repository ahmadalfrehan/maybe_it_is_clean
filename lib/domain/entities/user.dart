import 'Address.dart';
import 'Company.dart';

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.website,
    required this.address,
    required this.phone,
    required this.company,
  });
}
