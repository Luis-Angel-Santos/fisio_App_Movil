import 'package:fisio/ui/input_decorations.dart';
import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PacienteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                PacienteImage(),
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
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Nombre del Paciente:', hintText: 'Nombre:'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Apellidos:', hintText: 'Apellidos:'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Numero de telefono', hintText: 'Tel:'),
              ),
              SizedBox(
                height: 30,
              ),
              SwitchListTile.adaptive(
                  value: true,
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
