import 'package:fisio/services/pacientes_service.dart';
import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pacientesService = Provider.of<PacienteService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Historias Clinicas'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'paciente'),
              child: PacienteCard())),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
