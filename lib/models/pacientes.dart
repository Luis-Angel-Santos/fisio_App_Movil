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
      required this.fecha,
      required this.edad,
      required this.sexo,
      required this.ocupacion,
      required this.estadoCivil,
      required this.domicilio,
      required this.alimentacion,
      required this.ejercicio,
      required this.pasatiempo,
      required this.religion,
      required this.adicciones,
      this.id});

  String apellidos;
  String? foto;
  String nombreDelPaciente;
  int? telefono;
  bool available;
  String? id;
  String? fecha;
  String? edad;
  String? sexo;
  String? ocupacion;
  String? estadoCivil;
  String? domicilio;
  String? alimentacion;
  String? ejercicio;
  String? pasatiempo;
  String? religion;
  String? adicciones;

  factory Paciente.fromJson(String str) => Paciente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Paciente.fromMap(Map<String, dynamic> json) => Paciente(
      available: json["available"],
      nombreDelPaciente: json["Nombre del paciente"],
      apellidos: json["Apellidos"],
      foto: json["Foto"],
      telefono: json["Telefono"],
      fecha: json["Fecha"],
      edad: json["Edad"],
      sexo: json["Sexo"],
      ocupacion: json["Ocupacion"],
      estadoCivil: json["Estado Civil"],
      domicilio: json["Domicilio"],
      alimentacion: json["Alimentacion"],
      ejercicio: json["Ejercicio"],
      pasatiempo: json["Pasatiempo"],
      religion: json["Religion"],
      adicciones: json["Adicciones"]);

  Map<String, dynamic> toMap() => {
        "Apellidos": apellidos,
        "Foto": foto,
        "Nombre del paciente": nombreDelPaciente,
        "Telefono": telefono,
        "available": available,
        "Fecha": fecha,
        "Edad": edad,
        "Sexo": sexo,
        "Ocupacion": ocupacion,
        "Estado Civil": estadoCivil,
        "Domicilio": domicilio,
        "Alimentacion": alimentacion,
        "Ejercicio": ejercicio,
        "Pasa Tiempo": pasatiempo,
        "Religion": religion,
        "Adicciones": adicciones,
      };

  Paciente copy() => Paciente(
        available: this.available,
        nombreDelPaciente: this.nombreDelPaciente,
        apellidos: this.apellidos,
        foto: this.foto,
        telefono: this.telefono,
        fecha: this.fecha,
        edad: this.edad,
        sexo: this.sexo,
        ocupacion: this.ocupacion,
        estadoCivil: this.estadoCivil,
        domicilio: this.domicilio,
        alimentacion: this.alimentacion,
        ejercicio: this.ejercicio,
        pasatiempo: this.pasatiempo,
        religion: religion,
        adicciones: this.adicciones,
        id: this.id,
      );
}
