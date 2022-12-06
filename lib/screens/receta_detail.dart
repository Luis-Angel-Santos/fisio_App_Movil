import 'package:flutter/material.dart';
import 'package:fisio/widgets/burguer_menu.dart';

class RecetaDetail extends StatelessWidget {
  final String idUser;
  final String idExpediente;
  final String descripcion;
  final String fecha;
  final String nombreMedico;
  final String nombrePaciente;
  final String tratamiento;
  RecetaDetail({required this.idUser, required this.idExpediente, required this.descripcion, required this.fecha, required this.nombreMedico, required this.nombrePaciente, required this.tratamiento});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Receta de $nombrePaciente'),
      ),
      drawer: BurguerMenu(idUser: idUser, idExpediente: idExpediente,),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
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
              SizedBox(
                height: 40,
              ),
              Text(
                  'Estimado $nombrePaciente, el Fisioterapeuta $nombreMedico te ha asignado lo siguiente',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Receta asignada el $fecha',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  'Descripcion de la receta: $descripcion',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  'Tratamiendot recomendado: $tratamiento',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),

            ]
          )
       
   
      )
    );
  }
}