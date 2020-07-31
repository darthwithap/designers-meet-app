class User {
  final String uid;
  final String name;
  final String email;
  final String phone;

  User({this.uid, this.name, this.email, this.phone});

  User getUserFromData(Map<String, dynamic> data) {
    return User(
        uid: data['uid'] ?? '',
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        phone: data['phone'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}

class UserData {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final int gender;
  final int type;
  final int size;

  UserData({this.uid, this.name, this.email, this.phone, this.gender, this.type, this .size});
}
