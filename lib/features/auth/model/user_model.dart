class UserModel {
  String? id;
  String? email;
  String? name;
  int? createdAt;

  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          email: json['email'],
          name: json['name'],
          createdAt: json['createdAt'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "name": name,
      "createdAt": createdAt,
    };
  }
}
