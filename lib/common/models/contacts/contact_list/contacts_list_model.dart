class Contact {
  final String lastName;
  final String firstName;
  final String middleName;
  final String phoneNumber;
  final String country;
  final String region;
  final String city;
  final String birthDate;

  Contact({
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.phoneNumber,
    required this.country,
    required this.region,
    required this.city,
    required this.birthDate,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      lastName: json['lastName'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      phoneNumber: json['phoneNumber'],
      country: json['country'],
      region: json['region'],
      city: json['city'],
      birthDate: json['birthDate'],
    );
  }
}
