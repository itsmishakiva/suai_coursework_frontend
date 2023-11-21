import 'package:flutter/material.dart';

class BasicUser {
  int id;
  String username;
  Color avatarColor;
  String? avatarPath;
  String? name;
  String? surname;
  String? statusInfo;
  String? description;
  String? email;

  BasicUser({
    required this.id,
    required this.username,
    required this.avatarColor,
    this.avatarPath,
    this.name,
    this.surname,
    this.statusInfo,
    this.description,
    this.email,
  });
}