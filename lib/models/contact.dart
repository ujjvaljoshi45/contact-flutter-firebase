// Model Class

class Contact {
  String name;
  String phno;

  Contact({required this.name, required this.phno});

  Contact.fromMap(Map<String, dynamic> item)
      : name = item["name"],
        phno = item["phno"];

  Map<String, Object> toMap() {
    return {'name': name, 'phno': phno};
  }
}
