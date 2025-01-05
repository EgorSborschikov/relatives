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

/*void addContactToFirestore(Contact contact) {
  FirebaseFirestore.instance.collection('contacts').add(contact.toMap());
}*/

/*
//отображение контактов
StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('contacts').snapshots(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }
    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      return Text('No contacts available');
    }

    return ListView(
      children: snapshot.data!.docs.map((document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return ListTile(
          title: Text('${data['lastName']} ${data['firstName']} ${data['middleName']}'),
          subtitle: Text(data['phoneNumber']),
        );
      }).toList(),
    );
  },
)
*/