// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({
    this.documents,
  });

  List<Document> documents;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    documents: List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
  };
}

class Document {
  Document({
    this.name,
    this.fields,
    this.createTime,
    this.updateTime,
  });

  String name;
  Fields fields;
  DateTime createTime;
  DateTime updateTime;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
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
    this.taskGivenDate,
    this.isCompleted,
    this.taskCompletedDate,
    this.taskdescription,
    this.taskStatus,
  });

  TaskCompletedDateClass taskGivenDate;
  IsCompleted isCompleted;
  TaskCompletedDateClass taskCompletedDate;
  TaskCompletedDateClass taskdescription;
  TaskCompletedDateClass taskStatus;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    taskGivenDate: TaskCompletedDateClass.fromJson(json["taskGivenDate"]),
    isCompleted: IsCompleted.fromJson(json["isCompleted"]),
    taskCompletedDate: TaskCompletedDateClass.fromJson(json["taskCompletedDate"]),
    taskdescription: TaskCompletedDateClass.fromJson(json["taskdescription"]),
    taskStatus: TaskCompletedDateClass.fromJson(json["taskStatus"]),
  );

  Map<String, dynamic> toJson() => {
    "taskGivenDate": taskGivenDate.toJson(),
    "isCompleted": isCompleted.toJson(),
    "taskCompletedDate": taskCompletedDate.toJson(),
    "taskdescription": taskdescription.toJson(),
    "taskStatus": taskStatus.toJson(),
  };
}

class IsCompleted {
  IsCompleted({
    this.booleanValue,
  });

  bool booleanValue;

  factory IsCompleted.fromJson(Map<String, dynamic> json) => IsCompleted(
    booleanValue: json["booleanValue"],
  );

  Map<String, dynamic> toJson() => {
    "booleanValue": booleanValue,
  };
}

class TaskCompletedDateClass {
  TaskCompletedDateClass({
    this.stringValue,
  });

  String stringValue;

  factory TaskCompletedDateClass.fromJson(Map<String, dynamic> json) => TaskCompletedDateClass(
    stringValue: json["stringValue"],
  );

  Map<String, dynamic> toJson() => {
    "stringValue": stringValue,
  };
}
