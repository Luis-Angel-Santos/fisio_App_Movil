// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Paciente {
  Paciente(
      {required this.apellidos,
      required this.foto,
      required this.nombreDelPaciente,
      required this.telefono,
      required this.available,
      this.id});

  String apellidos;
  String foto;
  String nombreDelPaciente;
  int telefono;
  bool available;
  String? id;

  factory Paciente.fromJson(String str) => Paciente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Paciente.fromMap(Map<String, dynamic> json) => Paciente(
        available: json["available"],
        nombreDelPaciente: json["Nombre del paciente"],
        apellidos: json["Apellidos"],
        foto: json["Foto"],
        telefono: json["Telefono"],
      );

  Map<String, dynamic> toMap() => {
        "Apellidos": apellidos,
        "Foto": foto,
        "Nombre del paciente": nombreDelPaciente,
        "Telefono": telefono,
        "available": available,
      };

  Paciente copy() => Paciente(
        available: this.available,
        nombreDelPaciente: this.nombreDelPaciente,
        apellidos: this.apellidos,
        foto: this.foto,
        telefono: this.telefono,
        id: this.id,
      );
}
