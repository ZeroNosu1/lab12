// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    User user;

    Welcome({
        required this.user,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
    };
}

class User {
    String id;
    String userName;
    String name;
    String role;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.userName,
        required this.name,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        userName: json["user_name"],
        name: json["name"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user_name": userName,
        "name": name,
        "role": role,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
