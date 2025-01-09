//import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  final String lastName;
  final String firstName;
  final String middleName;
  final String birthDate;
  final String phoneNumber;
  final String country;
  final String region;
  final String city;

  Contact({
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.birthDate,
    required this.phoneNumber,
    required this.country,
    required this.region,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'lastName': lastName,
      'firstName': firstName,
      'middleName': middleName,
      'birthDate': birthDate,
      'phoneNumber': phoneNumber,
      'country': country,
      'region': region,
      'city': city,
    };
  }
}