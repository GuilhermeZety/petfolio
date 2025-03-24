// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PetModel extends Equatable {
  final int id;
  final String? name;
  final double? peso;
  final String? dataNascimento;
  final String? observacao;
  final String? qrCode;
  final String? corPrimaria;
  final String? corSecundaria;
  final String? raca;
  final String? animal;
  final String? foto;
  final int? termoUso;
  final int? qrCodeId;

  const PetModel({
    required this.id,
    required this.name,
    required this.peso,
    required this.dataNascimento,
    required this.observacao,
    required this.qrCode,
    required this.corPrimaria,
    required this.corSecundaria,
    required this.raca,
    required this.animal,
    required this.foto,
    required this.termoUso,
    required this.qrCodeId,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      peso,
      dataNascimento,
      observacao,
      qrCode,
      corPrimaria,
      corSecundaria,
      raca,
      animal,
      foto,
      termoUso,
      qrCodeId,
    ];
  }

  PetModel copyWith({
    int? id,
    String? name,
    double? peso,
    String? dataNascimento,
    String? observacao,
    String? qrCode,
    String? corPrimaria,
    String? corSecundaria,
    String? raca,
    String? animal,
    String? foto,
    int? termoUso,
    int? qrCodeId,
  }) {
    return PetModel(
      id: id ?? this.id,
      name: name ?? this.name,
      peso: peso ?? this.peso,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      observacao: observacao ?? this.observacao,
      qrCode: qrCode ?? this.qrCode,
      corPrimaria: corPrimaria ?? this.corPrimaria,
      corSecundaria: corSecundaria ?? this.corSecundaria,
      raca: raca ?? this.raca,
      animal: animal ?? this.animal,
      foto: foto ?? this.foto,
      termoUso: termoUso ?? this.termoUso,
      qrCodeId: qrCodeId ?? this.qrCodeId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'peso': peso,
      'data_nascimento': dataNascimento,
      'observacao': observacao,
      'qr_code': qrCode,
      'cor_primaria': corPrimaria,
      'cor_secundaria': corSecundaria,
      'raca': raca,
      'animal': animal,
      'foto': foto,
      'termo_uso': termoUso,
      'qr_code_id': qrCodeId,
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      peso: double.tryParse(map['peso'].toString()),
      dataNascimento: map['data_nascimento'] as String?,
      observacao: map['observacao'] as String?,
      qrCode: map['qr_code'] as String?,
      corPrimaria: map['cor_primaria'] as String?,
      corSecundaria: map['cor_secundaria'] as String?,
      raca: map['raca'] as String?,
      animal: map['animal'] as String?,
      foto: map['foto'] as String?,
      termoUso: map['termo_uso'] as int?,
      qrCodeId: map['qr_code_id'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  String get photo =>
      foto ??
      'https://media.istockphoto.com/id/541833910/vector/dog-and-cat-icon.jpg?s=612x612&w=0&k=20&c=n8AwpvJKqLKiHXDQUMeIN_PohTMxLFZ-LvlHg-PDgmc=';
}
