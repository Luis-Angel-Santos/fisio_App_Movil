import 'dart:convert';

class PacienteUser {
  PacienteUser(
      {
      required this.foto,
      required this.nombreDelPaciente,
      required this.apellidos,
      required this.edad,
      required this.sexo,
      required this.ocupacion,
      required this.estadoCivil,
      required this.domicilio,
      required this.telefono,
      //Correo + contraseña
      /*required this.available,
      required this.fecha,
      required this.alimentacion,
      required this.ejercicio,
      required this.pasatiempo,
      required this.religion,
      required this.adicciones, */
      this.id});

  String? foto;
  String nombreDelPaciente;
  String apellidos;
  String? edad;
  String? sexo;
  String? ocupacion;
  String? estadoCivil;
  String? domicilio;
  int? telefono;
  String? id;
  /*bool available;
  String? fecha;
  String? alimentacion;
  String? ejercicio;
  String? pasatiempo;
  String? religion;
  String? adicciones;*/

  factory PacienteUser.fromJson(String str) => PacienteUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PacienteUser.fromMap(Map<String, dynamic> json) => PacienteUser(
      foto: json["Foto"],
      nombreDelPaciente: json["Nombre del paciente"],
      apellidos: json["Apellidos"],
      edad: json["Edad"],
      sexo: json["Sexo"],
      ocupacion: json["Ocupacion"],
      estadoCivil: json["Estado Civil"],
      domicilio: json["Domicilio"], 
      telefono: json["Telefono"],


      /*available: json["available"],
      fecha: json["Fecha"],
      alimentacion: json["Alimentacion"],
      ejercicio: json["Ejercicio"],
      pasatiempo: json["Pasatiempo"],
      religion: json["Religion"],
      adicciones: json["Adicciones"]*/
      );

  Map<String, dynamic> toMap() => {
        "Foto": foto,
        "Nombre del paciente": nombreDelPaciente,
        "Apellidos": apellidos,
        "Edad": edad,
        "Sexo": sexo,
        "Ocupacion": ocupacion,
        "Estado Civil": estadoCivil,
        "Domicilio": domicilio,
        "Telefono": telefono,
        /*"available": available,
        "Fecha": fecha,
        "Alimentacion": alimentacion,
        "Ejercicio": ejercicio,
        "Pasatiempo": pasatiempo,
        "Religion": religion,
        "Adicciones": adicciones,*/
      };

  PacienteUser copy() => PacienteUser(
        foto: this.foto,
        nombreDelPaciente: this.nombreDelPaciente,
        apellidos: this.apellidos,
        edad: this.edad,
        sexo: this.sexo,
        ocupacion: this.ocupacion,
        estadoCivil: this.estadoCivil,
        domicilio: this.domicilio,
        telefono: this.telefono,
        /*available: this.available,
        fecha: this.fecha,
        alimentacion: this.alimentacion,
        ejercicio: this.ejercicio,
        pasatiempo: this.pasatiempo,
        religion: religion,
        adicciones: this.adicciones,*/
        id: this.id,
      );
}
