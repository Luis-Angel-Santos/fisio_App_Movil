import 'package:flutter/material.dart';
import 'package:fisio/screens/screens.dart';
import 'package:fisio/services/auth_service.dart';
import 'package:provider/provider.dart';

class BurguerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(),
          _buildDrawerItem(icon: Icons.account_circle, text: 'Mi perfil', onTap: () => {
              Navigator.pushReplacementNamed(context, 'perfil_paciente')
          }),
          _buildDrawerItem(icon: Icons.medical_information, text: 'Mis Recetas', onTap: () => {
            Navigator.pushReplacementNamed(context, 'home_paciente')
          }),
          _buildDrawerItem(icon: Icons.settings, text: 'Ajustes', onTap: () => {
            Navigator.pushReplacementNamed(context,'perfil_paciente') //TODO: Pantalla ajustes
          }),
          Divider(),
          _buildDrawerItem(icon: Icons.exit_to_app, text: 'Cerrar sesión', onTap: ()async => {
            await authService.logout(),
            Navigator.pushReplacementNamed(context,'login_paciente')
          }),
          Divider(), //<-- espacio
          ListTile(
            title: Text('Versión de la app 1.0.0'),
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
                   color: Colors.white,
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