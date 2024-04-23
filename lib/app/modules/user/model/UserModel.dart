class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.fcmToken,
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
}
