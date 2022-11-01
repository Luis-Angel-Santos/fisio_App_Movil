import 'package:fisio/providers/paciente_form_provider.dart';
import 'package:fisio/services/services.dart';
import 'package:fisio/ui/input_decorations.dart';
import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PacienteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pacienteService = Provider.of<PacienteService>(context);

    return ChangeNotifierProvider(
      create: (_) => PacienteFormProvider(pacienteService.selectedPaciente),
      child: _PacientesScreenBody(pacienteService: pacienteService),
    );
  }
}

class _PacientesScreenBody extends StatelessWidget {
  const _PacientesScreenBody({
    Key? key,
    required this.pacienteService,
  }) : super(key: key);

  final PacienteService pacienteService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                PacienteImage(url: pacienteService.selectedPaciente.foto),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      size: 40,
                      color: Colors.indigo,
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      //TODO: camara o galeria
                    },
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      size: 40,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ],
            ),
            _PacienteForm(),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: () {
          //TODO Guardar producto
        },
      ),
    );
  }
}

class _PacienteForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pacienteForm = Provider.of<PacienteFormProvider>(context);
    final paciente = pacienteForm.paciente;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: paciente.nombreDelPaciente,
                onChanged: (value) => paciente.nombreDelPaciente = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Nombre del Paciente:', hintText: 'Nombre:'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: paciente.apellidos,
                onChanged: (value) => paciente.apellidos = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'Los apellidos son obligatorios';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Apellidos:', hintText: 'Apellidos:'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: '${paciente.telefono}',
                onChanged: (value) {
                  if (int.tryParse(value) == null) {
                    paciente.telefono = 0;
                  } else {
                    paciente.telefono = int.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Numero de telefono', hintText: 'Tel:'),
              ),
              SizedBox(
                height: 30,
              ),
              SwitchListTile.adaptive(
                  value: paciente.available,
                  title: Text('Paciente Activo'),
                  activeColor: Colors.indigo,
                  onChanged: (value) {
                    // TODO: pendiente
                  }),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]);
}
