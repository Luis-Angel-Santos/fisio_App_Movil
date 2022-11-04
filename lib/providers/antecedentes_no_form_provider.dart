import 'package:fisio/models/models.dart';
import 'package:flutter/material.dart';

class AntecedentesNoFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Paciente alcoholismo;

  AntecedentesNoFormProvider(this.alcoholismo);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
