import 'package:flutter/material.dart';
import 'package:fisio/widgets/burguer_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
         child:  Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    SizedBox( height: 140.0, width: 140.0, child: Image.asset('assets/Logo.png'))
                  ],
                ),
              ),
              SizedBox(
                height: 40,
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
                        height: 20,
                      ),
                      Text(
                        'FISIO',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Sobre nosotros',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Fisio es un equipo de trabajo, orientado en desarrollar y crear nuevas soluciones a problemas que normalmente nos encontramos',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        'En Fisio, nos enfocamos en crear, innovar y explorar nuevos caminos que ayuden a la sociedad.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Síguenos',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            iconSize: 26.0, color: Colors.blue,
                            onPressed: () => launch("https://www.facebook.com/Universidad-Tecnol%C3%B3gica-De-Tlaxcala-155983347830609/"),
                            icon: Icon( FontAwesomeIcons.facebook, ),
                          ),
                          IconButton(
                            iconSize: 26.0, color: Colors.purple,
                            onPressed: () => launch("https://www.instagram.com/ut_tlaxcala/?hl=es"),
                            icon: Icon( FontAwesomeIcons.instagram, ),
                          ),
                          IconButton(
                            iconSize: 26.0, color: Colors.blue,
                            onPressed: () => launch("https://twitter.com/uttlaxcala"),
                            icon: Icon( FontAwesomeIcons.twitter, ),
                          ),
                          IconButton(
                            iconSize: 26.0, color: Colors.red,
                            onPressed: () => launch("https://www.youtube.com/user/uttoficial"),
                            icon: Icon( FontAwesomeIcons.youtube, ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ]
                  )
                )
              ),
               SizedBox(
                height: 80,
              ),
              Text(
                  'C. Francisco Sabaria 1008 Centro. 90300 Apizaco, tlax',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(text: TextSpan(children: [
                        TextSpan(text: '© 2022 ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        TextSpan(text: 'JESLA ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                        TextSpan(text: '- Todos los Derechos Reservados.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                      ])),
              SizedBox(
                height: 20,
              ),
            ]
         )
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