// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final String pais;
  final String estado;
  final String cidade;
  final String bairro;
  final String rua;
  final String? numero;
  final String? complemento;
  final String? cep;

  const AddressModel({
    required this.pais,
    required this.estado,
    required this.cidade,
    required this.bairro,
    required this.rua,
    required this.numero,
    required this.complemento,
    required this.cep,
  });

  @override
  List<Object?> get props {
    return [pais, estado, cidade, bairro, rua, numero, complemento, cep];
  }

  AddressModel copyWith({
    String? pais,
    String? estado,
    String? cidade,
    String? bairro,
    String? rua,
    String? numero,
    String? complemento,
    String? cep,
  }) {
    return AddressModel(
      pais: pais ?? this.pais,
      estado: estado ?? this.estado,
      cidade: cidade ?? this.cidade,
      bairro: bairro ?? this.bairro,
      rua: rua ?? this.rua,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      cep: cep ?? this.cep,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pais': pais,
      'estado': estado,
      'cidade': cidade,
      'bairro': bairro,
      'rua': rua,
      'numero': numero,
      'complemento': complemento,
      'cep': cep,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      pais: map['pais'] as String,
      estado: map['estado'] as String,
      cidade: map['cidade'] as String,
      bairro: map['bairro'] as String,
      rua: map['rua'] as String,
      numero: map['numero'] as String?,
      complemento: map['complemento'] as String?,
      cep: map['cep'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
