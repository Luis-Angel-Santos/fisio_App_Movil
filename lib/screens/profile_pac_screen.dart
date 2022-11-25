import 'package:fisio/ui/input_decorations.dart';
import 'package:fisio/widgets/burguer_menu.dart';
import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePaciente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
        title: Text('Mi Perfil'),
      ),
      drawer: BurguerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
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
                height: 30,
              ),
              CircleAvatar(
                  //backgroundImage: AssetImage('assets/Logo.png'),
                 radius: 80,
                  //TODO: Seleccionar foto de galeria o cámara
                ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                initialValue: '',
                onChanged: (value) => 'Nombre',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Nombre del Paciente:', hintText: 'Nombre'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: '',
                onChanged: (value) => 'Apellidos',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'Los apellidos son obligatorios';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Apellidos:', hintText: 'Apellidos'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: '',
                onChanged: (value) => 'Paciente edad',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La edad es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Edad:', hintText: 'Edad'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: '',
                onChanged: (value) => 'Paciente sexo',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El sexo  es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Sexo:', hintText: 'Masculino o Femenino'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: '',
                onChanged: (value) => 'Paciente ocupacion',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La ocupacion es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Ocupacion:', hintText: 'Ejemplo: Estudiante'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: '',
                onChanged: (value) => 'Paciente EstadoCivil',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El estado civil es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Estado Civil:', hintText: 'Ejemplo: Soltero'),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextFormField(
                  initialValue: '',
                  onChanged: (value) => 'Paciente Domicilio',
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'El domicilio es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Domicilio:',
                      hintText: 'Calle, numero, colonia, estado y municipio'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: '',
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
                    labelText: 'Número de teléfono:', hintText: 'Tel:'),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                 autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'yourname@example.com',
                      labelText: 'Correo electrónico:'),
                  onChanged: (value) => 'Correo',
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = new RegExp(pattern);

                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El correo no es correcto';
                  },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                 autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '******',
                      labelText: 'Contraseña:'),
                  onChanged: (value) => 'Password',
                  validator: (value) {
                    return (value != null && value.length >= 6)
                        ? null
                        : 'La contraseña debe de ser de 6 caracteres';
                  },
              ),
              SizedBox(
                height: 40,
              ),
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
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]);
}