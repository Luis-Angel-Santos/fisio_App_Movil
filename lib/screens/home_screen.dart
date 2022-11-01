import 'package:fisio/screens/screens.dart';
import 'package:fisio/services/pacientes_service.dart';
import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pacientesService = Provider.of<PacienteService>(context);

    if (pacientesService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text('Historias Clinicas'),
      ),
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
        onPressed: () {},
      ),
    );
  }
}
