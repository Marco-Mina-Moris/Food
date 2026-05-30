class UserModel {
  String? id;
  String? email;
  String? name;
  int? createdAt;
  String? phone;
  String? bio;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.createdAt,
    this.phone,
    this.bio,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          email: json['email'],
          name: json['name'],
          createdAt: json['createdAt'],
          phone: json['phone'],
          bio: json['bio'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "name": name,
      "createdAt": createdAt,
      "phone": phone,
      "bio": bio,
    };
  }
}
