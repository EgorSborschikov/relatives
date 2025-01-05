class Contact {
  final String lastName;
  final String firstName;
  final String middleName;
  final String phoneNumber;

  Contact({
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'lastName': lastName,
      'firstName': firstName,
      'middleName': middleName,
      'phoneNumber': phoneNumber,
    };
  }
}