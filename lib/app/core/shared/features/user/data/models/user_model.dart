// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String cpf;
  final String? photo;
  final String phone;

  const UserModel({
    required this.id,
    required this.name,
    required this.cpf,
    required this.phone,
    this.photo,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? cpf,
    String? photo,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      photo: photo ?? this.photo,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap({bool addPhoneArea = true}) {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'cpf': cpf,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    var phone = map['phone'] as String;
    if (phone.length == 13) {
      phone = phone.substring(2);
    }

    return UserModel(
      id: map['id'] as int? ?? 0,
      name: map['name'] as String,
      cpf: map['cpf'] as String,
      photo: map['photo'] as String?,
      phone: phone,
    );
  }

  String toJson({bool addPhoneArea = true}) =>
      json.encode(toMap(addPhoneArea: addPhoneArea));

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [id, name, cpf, photo, phone];
  }
}
