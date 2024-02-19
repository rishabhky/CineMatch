// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String username;
  final String email;
  final String? token;
  final String password;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'username': username,
      'email': email,
      'password': password,
    };

    if (id.isNotEmpty) {
      map['id'] = id;
    }

    if (token != null && token!.isNotEmpty) {
      map['token'] = token;
    }

    return map;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      token: map['token'] as String?,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
