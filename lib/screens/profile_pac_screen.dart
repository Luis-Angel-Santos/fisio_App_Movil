import 'package:fisio/providers/antecedentes_no_form_provider.dart';
import 'package:fisio/providers/paciente_form_provider.dart';
import 'package:fisio/services/services.dart';
import 'package:fisio/ui/input_decorations.dart';
import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProfilePaciente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                PacienteImage(url: 'aa.com'), //TODO: add image
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
          //TODO Guardar datos
        },
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                PacienteImage(url: 'pacienteService.selectedPaciente.foto'), //TODO: Add foto
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
          //TODO Guardar datos
        },
      ),
    );
  }


class _PacienteForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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
                initialValue: 'Nombre Paciente',
                onChanged: (value) => 'Nombre paciente',
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
                initialValue: 'Apellidos paciente',
                onChanged: (value) => 'Apellidos paciente',
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
                initialValue: 'Paciente edad',
                onChanged: (value) => 'Paciente edad',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La edad es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Edad:', hintText: 'Edad: '),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: 'Paciente sexo',
                onChanged: (value) => 'Paciente sexo',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El sexo  es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Sexo:', hintText: 'Masculino o Femenino: '),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: 'Paciente ocupacion',
                onChanged: (value) => 'Paciente ocupacion',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La ocupacion es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Ocupacion:', hintText: 'Ejemplo: Estudiante '),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: 'paciente.estadoCivil',
                onChanged: (value) => 'paciente.estadoCivil',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El estado civil es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Estado Civil:', hintText: 'Ejemplo: Soltero '),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextFormField(
                  initialValue: 'paciente.domicilio',
                  onChanged: (value) => 'paciente.domicilio',
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'El domicilio es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Domicilio:',
                      hintText: 'Calle, numero, colonia, estado y municipio '),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: 'paciente.telefono',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  if (int.tryParse(value) == null) {
                    //paciente.telefono = 0;
                  } else {
                    //paciente.telefono = int.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Numero de telefono', hintText: 'Tel:'),
              ),
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