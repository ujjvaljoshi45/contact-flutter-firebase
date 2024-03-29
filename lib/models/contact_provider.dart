// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts/models/contact.dart';

class ContactModel extends ChangeNotifier {
  List<Contact> contacts = [];
  bool isRefreshed = false;

  // Instance of Firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Contact> contactList() {
    if (!isRefreshed) {
      updateContactsListFromDatabase();
    }
    return contacts;
  }

  Future<void> updateContactsListFromDatabase() async {
    CollectionReference cr = firestore.collection("contacts");

    QuerySnapshot<Object?> res = await cr.get();

    List<QueryDocumentSnapshot> listOfResult = res.docs;

    List<Contact> newContacts = [];

    for (var index in listOfResult) {
      newContacts.add(Contact(name: index["name"], phno: index["phno"]));
    }
    contacts = newContacts;
    isRefreshed = true;
    notifyListeners();
  }

  void addContact(String name, String phno) async {
    Contact newContact = Contact(name: name, phno: phno);

    contacts.add(newContact);

    // add data to database
    await firestore
        .collection("contacts")
        .add({
          "name": name,
          "phno": phno,
        })
        .then((value) => print("Data Added"))
        .catchError((e) => print("Error provider : $e"));
    notifyListeners();
  }

  void deleteContact(int index) async {
    // await SqliteService().deleteItem(contacts[index].phno);
    contacts.removeAt(index);

    notifyListeners();
  }

  void updateContact(int index, String name, String phno) {
    contacts[index].name = name;
    contacts[index].phno = phno;

    notifyListeners();
  }
}
