import 'package:flutter/material.dart';

class RecetaDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Receta #N'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  'Aquí se encuentran todas sus recetas activas en este momento.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
            ]
          )
        )
      )
    );
  }
}