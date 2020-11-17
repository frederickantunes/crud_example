
import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.avatarUrl,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        avatarUrl = json['avatarUrl'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'email': email, 'avatarUrl': avatarUrl};
}

//Criando uma classe apenas para coletar os dados do formulario
