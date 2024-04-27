class UserModel {
  UserModel({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.password = '',
    this.fcmToken = '',
  });

  String email;
  String name;
  String phone;
  String password;
  String fcmToken;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        fcmToken: json["fcmToken"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "fcmToken": fcmToken,
      };

  @override
  String toString() {
    return "name: $name, email: $email";
  }
}
