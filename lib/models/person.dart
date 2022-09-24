import 'package:flutter/foundation.dart';

@immutable
class Person {
  final int id;
  final String name;
  final String connectionId;

  const Person({
    required this.id,
    required this.name,
    required this.connectionId,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'] ?? "",
      connectionId: json['connection_id'] ?? "",
    );
  }

  static List<Person> fetchData(List data) {
    List items = data;
    List<Person> peoples = [];

    for (int i = 0; i < items.length; i++) {
      peoples.add(Person.fromJson(items[i]));
    }
    return peoples;
  }

}