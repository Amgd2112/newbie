import 'package:flutter/material.dart';

class NewbieItem {
  final String title;
  final String? description;
  final Enum type;
  final IconData? icon;
  const NewbieItem({required this.title, this.description, required this.type, this.icon});
}
