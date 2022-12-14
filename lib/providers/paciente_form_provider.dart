import 'package:fisio/models/models.dart';
import 'package:flutter/material.dart';

class PacienteFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Paciente paciente;

  PacienteFormProvider(this.paciente);

  updateAvailability(bool value) {
    print(value);
    this.paciente.available = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(paciente.nombreDelPaciente);
    print(paciente.apellidos);
    print(paciente.available);

    return formKey.currentState?.validate() ?? false;
  }
}
