import 'package:app_02/messages.dart';

class Person {
  String name;
  String imageUrl;
  List<Messages> messages;

  Person({
    required this.name,
    required this.imageUrl,
    required this.messages,
  });
}
