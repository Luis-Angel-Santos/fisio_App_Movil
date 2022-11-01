import 'dart:convert';

import 'package:fisio/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PacienteService extends ChangeNotifier {
  final String _baseUrl = 'fisio-7c2ac-default-rtdb.firebaseio.com';
  final List<Paciente> pacientes = [];
  late Paciente selectedPaciente;

  bool isLoading = true;

  PacienteService() {
    this.loadPacientes();
  }

  //TODO: <List<Paciente>>
  Future loadPacientes() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'Paciente.json');
    final resp = await http.get(url);

    final Map<String, dynamic> pacientesMap = json.decode(resp.body);

    pacientesMap.forEach((key, value) {
      final tempPaciente = Paciente.fromMap(value);
      tempPaciente.id = key;
      this.pacientes.add(tempPaciente);
    });

    this.isLoading = false;
    notifyListeners();
    return this.pacientes;
  }
}
