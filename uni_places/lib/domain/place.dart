import 'dart:io';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  Place({required this.name, required this.photo}) : id = uuid.v4();
  final String id;
  final String name;
  File photo;
}
