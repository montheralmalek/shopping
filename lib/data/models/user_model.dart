// import 'package:hive/hive.dart';
// part 'user_model.g.dart';
// @HiveType(typeId: 4)
class UserModel {
  final int id;
  final String email;
  final String username;
  final String password;
  final Name name;
  final Address address;
  final String phone;
  UserModel(
      {required this.id,
      required this.email,
      required this.username,
      required this.password,
      required this.name,
      required this.phone,
      required this.address});

  factory UserModel.fromJson(jsonData) {
    return UserModel(
        id: jsonData['id'],
        email: jsonData['email'],
        username: jsonData['username'],
        password: jsonData['password'],
        name: Name.fromJson(jsonData['name']),
        phone: jsonData['phone'],
        address: Address.fromJson(jsonData['address']));
  }
}

class Name {
  final String firstname;
  final String lastname;
  Name({
    required this.firstname,
    required this.lastname,
  });
  factory Name.fromJson(jsonData) {
    return Name(
      firstname: jsonData['firstname'],
      lastname: jsonData['lastname'],
    );
  }
}

class Address {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final Geolocation geolocation;
  Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });
  factory Address.fromJson(jsonData) {
    return Address(
        city: jsonData['city'],
        street: jsonData['street'],
        number: jsonData['number'],
        zipcode: jsonData['zipcode'],
        geolocation: Geolocation.fromJson(jsonData['geolocation']));
  }
}

class Geolocation {
  final String lat;
  final String long;
  Geolocation({
    required this.lat,
    required this.long,
  });
  factory Geolocation.fromJson(jsonData) {
    return Geolocation(lat: jsonData['lat'], long: jsonData['long']);
  }
}
