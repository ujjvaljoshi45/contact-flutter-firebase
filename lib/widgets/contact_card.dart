// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/contact_provider.dart';

class ContactCard extends StatelessWidget {
  String name = 'Name';
  String phno = '+1234567890';
  int index;
  ContactCard(
      {super.key, required this.name, required this.phno, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactModel>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          tileColor: const Color.fromRGBO(69, 96, 135, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(10),
          dense: true,
          leading: CircleAvatar(
            child: Text(name[0]),
          ),
          title: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            phno,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          trailing: PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          String newName = name;
                          String newPhno = phno;
                          return SimpleDialog(
                            title: Text('Edit Contact'),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: TextEditingController(text: name),
                                  onChanged: (value) {
                                    newName = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: TextEditingController(text: phno),
                                  onChanged: (value) {
                                    newPhno = value;
                                  },
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Provider.of<ContactModel>(context,
                                          listen: false)
                                      .updateContact(index, newName, newPhno);
                                  Navigator.pop(context);
                                },
                                child: Text('Save'),
                              )
                            ],
                          );
                        });
                  },
                  child: Text('Edit'),
                ),
                PopupMenuItem(
                  onTap: () {
                    Provider.of<ContactModel>(context, listen: false)
                        .deleteContact(index);
                  },
                  child: Text('Delete'),
                ),
              ];
            },
          ),
        ),
      );
    });
  }
}
