import 'package:flutter/material.dart';
import 'package:my_contacts/models/contact.dart';
import 'package:my_contacts/models/contact_provider.dart';
import 'package:my_contacts/views/add_contact.dart';
import 'package:provider/provider.dart';

import '../widgets/contact_card.dart';

class MyHome extends StatefulWidget {
  MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String name = '';
  String phno = '';
  bool isRefreshed = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isRefreshed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    //List contacts = ContactModel().contactList;

    return Consumer<ContactModel>(builder: (context, value, child) {
      List<Contact> contactList = value.contactList();
      print("Length: ${contactList.length}");
      return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: const Color.fromRGBO(69, 96, 135, 1),
          title: const Text(
            'Contacts',
            style: TextStyle(color: Colors.white),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isDismissible: true,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: AddContactModal(),
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromRGBO(69, 96, 135, 1),
        ),
        body: Center(
            child: ListView(
          children: [
            for (int i = 0; i < contactList.length; i++)
              ContactCard(
                  name: contactList[i].name,
                  phno: contactList[i].phno,
                  index: i),
          ],
        )),
      );
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = [
    Contact(name: 'name', phno: 'phNo'),
    Contact(name: 'name', phno: 'phNo')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(),
                      ),
                    ));
          }),
      body: ListView.builder(
          itemBuilder: (context, index) {
            // List of Contacts

            return ContactCard(
              name: contacts[index].name,
              phno: contacts[index].phno,
              index: index,
            );
          },
          itemCount: contacts.length),
    );
  }
}
