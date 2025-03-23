// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:petfolio/app/core/shared/models/address_model.dart';
import 'package:petfolio/app/core/shared/models/pet_model.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? avatarUrl;
  final AddressModel address;
  final String status;
  final String? asaasCustomerId;
  final String cpf;
  final List<PetModel> petsOwner;
  final List<PetModel> pets;
  final String token;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.address,
    required this.status,
    required this.asaasCustomerId,
    required this.cpf,
    required this.petsOwner,
    required this.pets,
    required this.token,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      avatarUrl,
      address,
      status,
      asaasCustomerId,
      cpf,
      petsOwner,
      pets,
      token,
    ];
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? avatarUrl,
    AddressModel? address,
    String? status,
    String? asaasCustomerId,
    String? cpf,
    List<PetModel>? petsOwner,
    List<PetModel>? pets,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      address: address ?? this.address,
      status: status ?? this.status,
      asaasCustomerId: asaasCustomerId ?? this.asaasCustomerId,
      cpf: cpf ?? this.cpf,
      petsOwner: petsOwner ?? this.petsOwner,
      pets: pets ?? this.pets,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'avatar_url': avatarUrl,
        'address': address.toMap(),
        'status': status,
        'asaas_customer_id': asaasCustomerId,
        'cpf': cpf,
        'pets_owner': petsOwner.map((x) => x.toMap()).toList(),
        'pets': pets.map((x) => x.toMap()).toList(),
      },
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    var user = map['user'] as Map<String, dynamic>;
    return UserModel(
      id: user['id'] as int,
      name: user['name'] as String,
      email: user['email'] as String,
      phone: user['phone'] as String,
      avatarUrl: user['avatar_url'] as String?,
      address: AddressModel.fromMap(user['address'] as Map<String, dynamic>),
      status: user['status'] as String,
      asaasCustomerId:
          user['asaas_customer_id'] != null
              ? user['asaas_customer_id'] as String
              : null,
      cpf: user['cpf'] as String,
      petsOwner:
          user['pets_owner']
              .map<PetModel>((x) => PetModel.fromMap(x as Map<String, dynamic>))
              .toList(),
      pets:
          user['pets']
              .map<PetModel>((x) => PetModel.fromMap(x as Map<String, dynamic>))
              .toList(),
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
