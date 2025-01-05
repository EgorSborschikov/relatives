/*
Future<Contact?> getContactFromFirestore(String contactId) async {
  DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('contacts').doc(contactId).get();
  if (snapshot.exists) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Contact(
      lastName: data['lastName'],
      firstName: data['firstName'],
      middleName: data['middleName'],
      birthDate: data['birthDate'],
      phoneNumber: data['phoneNumber'],
      country: data['country'],
      region: data['region'],
      city: data['city'],
    );
  } else {
    return null;
  }
}
// contacts_update
void updateContactInFirestore(String contactId, Contact updatedContact) {
  FirebaseFirestore.instance.collection('contacts').doc(contactId).update(updatedContact.toMap());
}

//delete contacts
void deleteContactFromFirestore(String contactId) {
  FirebaseFirestore.instance.collection('contacts').doc(contactId).delete();
}
*/