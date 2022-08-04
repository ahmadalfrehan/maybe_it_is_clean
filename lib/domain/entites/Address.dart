class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Map<String, String>? geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}
