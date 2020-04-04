class User {
  final String id;
  final String fullname;
  final String email;
  final String phonenumber;
  final String address;
  final String location;
  int count;

  User(this.id, this.fullname, this.email, this.phonenumber, this.address,
      this.location, this.count);

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullname = data['fullname'],
        email = data['email'],
        phonenumber = data['phonenumber'],
        address = data['address'],
        location = data['location'],
        count = data['count'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'email': email,
      'phonenumber': phonenumber,
      'address': address,
      'location': location,
      'count': count
    };
  }
}
