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
          child:  Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: _buildBoxDecoration(),
                  child:  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      FloatingActionButton(
                      child: Icon(Icons.arrow_back_sharp),
                      onPressed: () => Navigator.of(context).pop(),                      
                      ),   
                      SizedBox(
                        height: 30,
                      ),             
                      Text(
                        'Estimad@ $nombrePaciente, el/la Fisioterapeuta $nombreMedico te ha asignado lo siguiente:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(text: TextSpan(children: [
                        TextSpan(text: 'Receta asignada el ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        TextSpan(text: '$fecha', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black))
                      ])),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(text: TextSpan(children: [
                        TextSpan(text: 'Descripción de la receta: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        TextSpan(text: '$descripcion', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black))
                      ])),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(text: TextSpan(children: [
                        TextSpan(text: 'Tratamiento recomendado: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        TextSpan(text: '$tratamiento', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black))
                      ])),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                )
              ),
            ]
          )
      )
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