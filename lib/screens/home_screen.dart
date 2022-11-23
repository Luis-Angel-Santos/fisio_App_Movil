import 'package:fisio/screens/screens.dart';
import 'package:fisio/services/auth_service.dart';
import 'package:fisio/services/pacientes_service.dart';
import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pacientesService = Provider.of<PacienteService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if (pacientesService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
          title: Text('Historias Clinicas'),
          leading: IconButton(
            icon: Icon(Icons.login_outlined),
            onPressed: () async {
              await authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
          )),
      body: ListView.builder(
          itemCount: pacientesService.pacientes.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                pacientesService.selectedPaciente =
                    pacientesService.pacientes[index].copy();
                Navigator.pushNamed(context, 'paciente');
              },
              child: PacienteCard(
                paciente: pacientesService.pacientes[index],
              ))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          pacientesService.selectedPaciente = new Paciente(
              nombreDelPaciente: '',
              apellidos: '',
              edad: '',
              adicciones: '',
              alimentacion: '',
              available: false,
              domicilio: '',
              ejercicio: '',
              estadoCivil: '',
              fecha: '',
              ocupacion: '',
              pasatiempo: '',
              religion: '',
              sexo: '',
              telefono: 0,
              foto: null);
          Navigator.pushNamed(context, 'paciente');
        },
      ),
    );
  }
}
