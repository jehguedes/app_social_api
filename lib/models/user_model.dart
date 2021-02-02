import 'package:app_social_api/models/adress_model.dart';

class User {
  int id;
  String name, username, email, phone, website;
  Address address;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        address = Address.fromJson(json['address']),
        phone = json['phone'],
        website = json['website'];
}
