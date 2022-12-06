import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio/screens/receta_detail.dart';
import 'package:fisio/services/paciente_user_service.dart';
import 'package:fisio/widgets/burguer_menu.dart';
import 'package:flutter/material.dart';
import 'package:fisio/services/auth_service.dart';
import 'package:fisio/services/pacientes_service.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePaciente extends StatelessWidget {
  final db = FirebaseFirestore.instance; 
  final String idUser;
  final String idExpediente;  
  HomePaciente({required this.idUser, required this.idExpediente});
  Stream<QuerySnapshot>? _recetasStream;

  @override
  Widget build(BuildContext context) {
    _recetasStream =  FirebaseFirestore.instance.collection('/expedientesMedicos/$idExpediente/recetasAsginadas').snapshots();
                            return Scaffold(
                              appBar: AppBar(
                                title: Text('Mis Recetas'),
                              ),
                              drawer: BurguerMenu(idExpediente:idExpediente, idUser: idUser,),
                              body: StreamBuilder<QuerySnapshot>(
                                stream: _recetasStream,
                                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    return const Text('Something went wrong');
                                  }

                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const Text("Loading");
                                  }

                                  return ListView(
                                    children: snapshot.data!.docs
                                        .map((DocumentSnapshot document) {
                                          Map<String, dynamic> data =
                                              document.data()! as Map<String, dynamic>;
                                          return Column(
            children: [
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 50,
              ),
              DataTable(  
              columns: [  
                DataColumn(label: Text(  
                    '#',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
                DataColumn(label: Text(  
                    'Receta/Tratamiento',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
                DataColumn(label: Text(  
                    'Días',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
                DataColumn(label: Text(  
                    'Fecha',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
              ],  
              rows: [  
                DataRow(cells: [  
                  DataCell(
                    GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RecetaDetail(idUser: idUser, idExpediente: idExpediente, descripcion: data['descripcion'], fecha: data['fecha'], nombreMedico: data['nombreMedico'], nombrePaciente: data['nombrePaciente'], tratamiento: data['tratamiento'],)));
                      },
                      child: Text('00', style: TextStyle(fontSize: 15.0))
                  )),
                  DataCell(GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RecetaDetail(idUser: idUser, idExpediente: idExpediente, descripcion: data['descripcion'], fecha: data['fecha'], nombreMedico: data['nombreMedico'], nombrePaciente: data['nombrePaciente'], tratamiento: data['tratamiento'],)));
                      },
                      child: Text(data['tratamiento'], style: TextStyle(fontSize: 15.0))
                  )),  
                 DataCell(GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RecetaDetail(idUser: idUser, idExpediente: idExpediente, descripcion: data['descripcion'], fecha: data['fecha'], nombreMedico: data['nombreMedico'], nombrePaciente: data['nombrePaciente'], tratamiento: data['tratamiento'],)));
                      },
                      child: Text('...', style: TextStyle(fontSize: 15.0))
                  )),  
                  DataCell(GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RecetaDetail(idUser: idUser, idExpediente: idExpediente, descripcion: data['descripcion'], fecha: data['fecha'], nombreMedico: data['nombreMedico'], nombrePaciente: data['nombrePaciente'], tratamiento: data['tratamiento'],)));
                      },
                      child: Text(data['fecha'], style: TextStyle(fontSize: 15.0))
                  )),  
                ]),  
              ],  
            ), 
            ]
          );
                                        })
                                        .toList()
                                        .cast(),
                                  );
                                },
                              )
                          );
                        }
  
  }

