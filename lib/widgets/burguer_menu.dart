import 'package:fisio/screens/ayuda.dart';
import 'package:flutter/material.dart';
import 'package:fisio/screens/screens.dart';
import 'package:fisio/services/auth_service.dart';
import 'package:provider/provider.dart';

class BurguerMenu extends StatelessWidget {
  final String idUser;
  final String idExpediente;
  BurguerMenu({required this.idUser, required this.idExpediente});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(),
          _buildDrawerItem(icon: Icons.account_circle, text: 'Mi perfil', onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfilePaciente(idUser: idUser, idExpediente: idExpediente,)))
          }),
          _buildDrawerItem(icon: Icons.medical_information, text: 'Mis Recetas', onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePaciente(idUser: idUser, idExpediente: idExpediente,)))
          }),
          _buildDrawerItem(icon: Icons.settings, text: 'Más opciones', onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Ayuda(idUser: idUser, idExpediente: idExpediente,)))
          }),
          Divider(),
          _buildDrawerItem(icon: Icons.exit_to_app, text: 'Cerrar sesión', onTap: ()async => {
            await authService.logout(),
            Navigator.pushReplacementNamed(context,'login_paciente')
          }),
          Divider(), //<-- espacio
          ListTile(
            title: Text('Versión de la app 2.1.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  //Header del menú
  Widget _buildDrawerHeader() {
  return DrawerHeader(
     margin: EdgeInsets.zero,
     padding: EdgeInsets.zero,
     decoration: BoxDecoration(
         image: DecorationImage(
             fit: BoxFit.fill,
             image:  AssetImage('assets/Logo.png'))), //TODO: New image header
     child: Stack(children: <Widget>[
       Positioned(
           bottom: 20.0,
           left: 20.0,
           child: Text("Fisio App",
               style: TextStyle(
                   color: Colors.black,
                   fontSize: 18.0,
                   fontWeight: FontWeight.w500))),
     ]));
  }

  Widget _buildDrawerItem(
    {required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
    
}