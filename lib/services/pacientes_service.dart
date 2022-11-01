import 'package:fisio/models/models.dart';
import 'package:flutter/material.dart';

class PacienteService extends ChangeNotifier {
  final String _baseUrl = 'fisio-7c2ac-default-rtdb.firebaseio.com';

  final List<Paciente> pacientes = [];

  bool isLoading = true;

  PacienteService() {
    this.loadPacientes();
  }

  //TODO: <List<Paciente>>
  Future loadPacientes() async {}
}
