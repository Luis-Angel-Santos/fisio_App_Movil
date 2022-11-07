import 'package:flutter/material.dart';

class HomePaciente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Mis Recetas'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                child: Text(
                  '#            RECETA / TRATAMIENTO            DIAS                FECHA',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                  'TODO: Tabla con recetas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'perfil_paciente');
                  },
                child: Text(
                  'Mi Perfil',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ]
          )
        )
      )
    );
  }
}
