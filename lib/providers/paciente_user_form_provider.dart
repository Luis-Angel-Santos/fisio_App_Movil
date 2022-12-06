import 'package:fisio/models/models.dart';
import 'package:flutter/material.dart';

class PacienteUserFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  PacienteUser paciente_user;

  PacienteUserFormProvider(this.paciente_user);

  updateAvailability(bool value) {
    print(value);
    notifyListeners();
  }

  bool isValidForm() {
    print(paciente_user.nombreDelPaciente);
    print(paciente_user.apellidos);

    return formKey.currentState?.validate() ?? false;
  }
}
