import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {

  final String name;
  final String typeUser;
  final String uid;
  final String urlAvatar;
  UserModel({
    required this.name,
    required this.typeUser,
    required this.uid,
    required this.urlAvatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'typeUser': typeUser,
      'uid': uid,
      'urlAvatar': urlAvatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: (map['name'] ?? '') as String,
      typeUser: (map['typeUser'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
      urlAvatar: (map['urlAvatar'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
