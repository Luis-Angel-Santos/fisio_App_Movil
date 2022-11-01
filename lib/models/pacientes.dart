// To parse this JSON data, do
//
//     final paciente = pacienteFromMap(jsonString);

import 'dart:convert';

class Paciente {
  Paciente({
    required this.id01,
    required this.id02,
  });

  Id01 id01;
  Id02 id02;

  factory Paciente.fromJson(String str) => Paciente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Paciente.fromMap(Map<String, dynamic> json) => Paciente(
        id01: Id01.fromMap(json["id_01"]),
        id02: Id02.fromMap(json["id_02"]),
      );

  Map<String, dynamic> toMap() => {
        "id_01": id01.toMap(),
        "id_02": id02.toMap(),
      };
}

class Id01 {
  Id01({
    required this.apellidos,
    required this.foto,
    required this.nombreDelPaciente,
    required this.telefono,
    required this.available,
  });

  String apellidos;
  String foto;
  String nombreDelPaciente;
  int telefono;
  bool available;

  factory Id01.fromJson(String str) => Id01.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Id01.fromMap(Map<String, dynamic> json) => Id01(
        apellidos: json["Apellidos"],
        foto: json["Foto"],
        nombreDelPaciente: json["Nombre del paciente"],
        telefono: json["Telefono"],
        available: json["available"],
      );

  Map<String, dynamic> toMap() => {
        "Apellidos": apellidos,
        "Foto": foto,
        "Nombre del paciente": nombreDelPaciente,
        "Telefono": telefono,
        "available": available,
      };
}

class Id02 {
  Id02({
    required this.apellidos,
    required this.nombre,
    required this.telefono,
    required this.available,
    required this.foto,
  });

  String apellidos;
  String nombre;
  int telefono;
  bool available;
  String foto;

  factory Id02.fromJson(String str) => Id02.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Id02.fromMap(Map<String, dynamic> json) => Id02(
        apellidos: json["Apellidos"],
        nombre: json["Nombre"],
        telefono: json["Telefono"],
        available: json["available"],
        foto: json["foto"],
      );

  Map<String, dynamic> toMap() => {
        "Apellidos": apellidos,
        "Nombre": nombre,
        "Telefono": telefono,
        "available": available,
        "foto": foto,
      };
}
