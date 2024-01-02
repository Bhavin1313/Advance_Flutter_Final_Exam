class Contact {
  int? id;
  String name;
  String email;
  String number;

  Contact(
      {this.id, required this.name, required this.email, required this.number});

  factory Contact.fromSQL({required Map data}) {
    return Contact(
      name: data['name'],
      id: data['id'],
      email: data['email'],
      number: data['number'],
    );
  }
}
