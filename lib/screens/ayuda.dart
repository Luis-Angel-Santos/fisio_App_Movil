import 'package:flutter/material.dart';
import 'package:fisio/widgets/burguer_menu.dart';

class Ayuda extends StatelessWidget {
  final String idUser;
  final String idExpediente;

  Ayuda({required this.idUser, required this.idExpediente });
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
      ),
      drawer: BurguerMenu(idUser: idUser, idExpediente: idExpediente,),
      body: SingleChildScrollView(
        
      ),
    );
  }
}