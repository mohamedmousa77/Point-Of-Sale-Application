class UserLogin {
  int id;
  String firstName;
  String token;
  late int businessId;
  UserLogin({
    required this.id,
    required this.firstName,
    required this.token,
    required this.businessId,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        id: json["id"],
        firstName: json["first_name"],
        token: json["token"],
        businessId: 1,
      );
  factory UserLogin.empty() => UserLogin(
        id: 0,
        firstName: "",
        token: "",
        businessId: 1,
      );

  void setBusinessId(int id) {
    businessId = id;
  }
}
