
class User {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final int gender;
  final int type;
  User({this.uid, this.name, this.email, this.phone, this.gender, this.type});

  User getUserFromData(Map<String, dynamic> data) {
    return User(
        uid: data['uid'] ?? '',
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        phone: data['phone'] ?? '',
        gender: data['gender'] ?? -1,
        type: data['type'] ?? -1);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'type': type
    };
  }
}
