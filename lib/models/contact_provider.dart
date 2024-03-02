// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

import 'package:my_contacts/models/contact.dart';

class ContactModel extends ChangeNotifier {
  List<Contact> contacts = [];
  // late SqliteService sqliteService;

  // ContactModel() {
  // sqliteService = SqliteService();
  // sqliteService.initializeDB().whenComplete(() async {
  // refersh contacts
  // await updateContactsListFromDatabase();
  // });
  // try {
  //   getDataFromHive();
  // } catch (e) {
  //   print("Empty");
  // }
  // }

  // final _myContacs = Hive.box('mycontacts');
  List<Contact> contactList() {
    // updateContactsListFromDatabase();
    return contacts;
  }

  // Future<void> updateContactsListFromDatabase() async {
  //   final data = await SqliteService().getItems();
  //   if (data.isNotEmpty) {
  //     contacts = data;
  //   }
  //   notifyListeners();
  // }

  void addContact(String name, String phno) async {
    Contact newContact = Contact(name: name, phno: phno);
    contacts.add(newContact);
    // addDataInHive();
    // getDataFromHive();

    // add data to database
    // await SqliteService().createItem(newContact);
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
