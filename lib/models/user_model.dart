// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
  UserModel({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });

  UserModel copyWith({
    int? id,
    String? email,
    String? firstname,
    String? lastname,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'first_name': firstname,
      'last_name': lastname,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      firstname: map['first_name'] as String,
      lastname: map['last_name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, first_name: $firstname, last_name: $lastname, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        avatar.hashCode;
  }
}
