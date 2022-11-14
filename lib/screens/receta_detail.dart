import 'package:flutter/material.dart';
import 'package:fisio/widgets/burguer_menu.dart';

class RecetaDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Receta #N'),
      ),
      drawer: BurguerMenu(),
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
                  'N días',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'N Noviembre 2022',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),


            ]
          )
       
   
      )
    );
  }
}