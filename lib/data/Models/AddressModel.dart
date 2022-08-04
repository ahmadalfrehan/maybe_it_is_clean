import 'package:lujain/domain/entities/Address.dart';

class AddressModel extends Address {
  AddressModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory AddressModel.fromJson(Map<dynamic, dynamic> json) {
    return AddressModel(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: {
        'lat': json['geo']['lat'],
        'lng': json['geo']['lng'],
      },
    );
  }
}
