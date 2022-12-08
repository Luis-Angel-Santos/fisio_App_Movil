import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fisio/screens/loading_screen.dart';
import 'package:fisio/services/paciente_user_service.dart';
import 'package:fisio/ui/input_decorations.dart';
import 'package:fisio/widgets/burguer_menu.dart';
import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../services/auth_service.dart';
import '../services/notifications_service.dart';
import 'home_pac_screen.dart';

class ProfilePaciente extends StatelessWidget {
  final String idUser;
  final String idExpediente;
  ProfilePaciente({required this.idUser, required this.idExpediente});
  final db = FirebaseFirestore.instance;
  var data;



  @override
  Widget build(BuildContext context) {
  
  CollectionReference user = FirebaseFirestore.instance.collection('pacientes');
  return Scaffold(
    appBar: AppBar(
        title: Text('Mi perfil'),
      ),
      drawer: BurguerMenu(idUser: idUser, idExpediente: idExpediente),
      body: FutureBuilder<DocumentSnapshot>(
      future: user.doc(idUser).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                _PacienteForm(data: data, id: idUser, idExpediente: idExpediente,),
                SizedBox(height: 100),
              ],
            ),
          );
          }
          return LoadingScreen();
        },
      ));
  }
}

class _PacienteForm extends StatelessWidget {
  final data;
  final id;
  final idExpediente;
  _PacienteForm({required this.data, required this.id, required this.idExpediente});

  TextEditingController name = new TextEditingController();
  TextEditingController apellidos = new TextEditingController();
  TextEditingController telefono = new TextEditingController();
  TextEditingController correo = new TextEditingController();

  GlobalKey<FormState> keyForm = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                  backgroundImage: AssetImage('assets/user.png'),
                  radius: 50,
                ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: name,
                onChanged: (value) => 'Nombre',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: data['nombre'], hintText: 'Nombre'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: apellidos,
                //initialValue: data['apellidos'],
                onChanged: (value) => 'Apellidos',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'Los apellidos son obligatorios';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: data['apellidos'], hintText: 'Apellidos'),
              ),
              SizedBox(
                height: 30,
              ),
              
              TextFormField(
                controller: telefono,
                //initialValue: data['telefono'],
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
                    labelText: data['telefono'], hintText: 'Tel:'),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: correo,
                //initialValue: data['correo'],
                 autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'yourname@example.com',
                      labelText: data['correo']),
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
              FloatingActionButton(
              child: Icon(Icons.save_outlined),
              onPressed: () {
                final authservice = Provider.of<PacienteUserService>(context, listen: false);
                try {
                  authservice.updateUser(id, name.text, apellidos.text, telefono.text, correo.text);
                  NotificationsService.showSnackbar('Datos Actualizados');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePaciente(idUser: id, idExpediente: idExpediente)));
                } catch (e) {
                  NotificationsService.showSnackbar('Oops hubo un error: $e');
                }
                
              },
              
            ),
            SizedBox(
                height: 30,
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

