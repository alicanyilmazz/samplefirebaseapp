// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
  Person({
    this.name,
    this.fields,
    this.createTime,
    this.updateTime,
  });

  String name;
  Fields fields;
  DateTime createTime;
  DateTime updateTime;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    name: json["name"],
    fields: Fields.fromJson(json["fields"]),
    createTime: DateTime.parse(json["createTime"]),
    updateTime: DateTime.parse(json["updateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "fields": fields.toJson(),
    "createTime": createTime.toIso8601String(),
    "updateTime": updateTime.toIso8601String(),
  };
}

class Fields {
  Fields({
    this.surname,
    this.email,
    this.name,
    this.password,
  });

  Email surname;
  Email email;
  Email name;
  Email password;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    surname: Email.fromJson(json["Surname"]),
    email: Email.fromJson(json["Email"]),
    name: Email.fromJson(json["Name"]),
    password: Email.fromJson(json["Password"]),
  );

  Map<String, dynamic> toJson() => {
    "Surname": surname.toJson(),
    "Email": email.toJson(),
    "Name": name.toJson(),
    "Password": password.toJson(),
  };
}

class Email {
  Email({
    this.stringValue,
  });

  String stringValue;

  factory Email.fromJson(Map<String, dynamic> json) => Email(
    stringValue: json["stringValue"],
  );

  Map<String, dynamic> toJson() => {
    "stringValue": stringValue,
  };
}
