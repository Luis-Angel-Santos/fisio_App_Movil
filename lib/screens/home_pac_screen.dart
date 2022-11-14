import 'package:fisio/widgets/burguer_menu.dart';
import 'package:flutter/material.dart';

class HomePaciente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Mis Recetas'),
      ),
      drawer: BurguerMenu(),
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
                  DataCell(Text('1')),  
                  DataCell(Text('Receta/Tratamiento')),  
                  DataCell(Text('3')),
                  DataCell(Text('01/Nov/22')),
                ]),  
                DataRow(cells: [  
                  DataCell(Text('2')),  
                  DataCell(Text('Receta/Tratamiento')),  
                  DataCell(Text('2')),
                  DataCell(Text('03/Nov/22')),  
                ]),  
                DataRow(cells: [  
                  DataCell(
                    Column(children:[Text('3', style: TextStyle(fontSize: 15.0))]),  
                  ),
                  DataCell(
                    Column(children:[Text('Receta/Tratamiento', style: TextStyle(fontSize: 15.0))]),  
                  ),
                  DataCell(
                    Column(children:[Text('3', style: TextStyle(fontSize: 15.0, color: Colors.blue, fontWeight: FontWeight.bold))]),  
                  ),
                  DataCell(
                    Column(children:[Text('05/Nov/22', style: TextStyle(fontSize: 15.0))]),  
                  ),
                ]),
              ],  
            ), 
            ]
          )
        )
      )
    );
  }
}