// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_contacts/models/contact_provider.dart';
import 'package:provider/provider.dart';

class AddContactModal extends StatefulWidget {
  AddContactModal({super.key});

  @override
  State<AddContactModal> createState() => _AddContactModalState();
}

class _AddContactModalState extends State<AddContactModal> {
  String name = '';

  String phno = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff1D3C67),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Add Contact",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                name = value;
              },
              decoration: const InputDecoration(
                labelText: 'Enter Name',
                hintText: '',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                phno = value;
              },
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Enter Phone Number',
                hintText: '',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<ContactModel>(context, listen: false)
                    .addContact(name, phno);
                // final contact = context.read<ContactModel>();
                // contact.addContact(name, phno);
                Navigator.pop(context);
              },
              child: const Text('Add Contact'),
            ),
          ),
        ],
      ),
    );
  }
}
