import 'package:fisio/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) return Text('Espere');

            // if(snapshot.data == ''){

            // }

            Future.microtask(() {
              Navigator.of(context).pushReplacementNamed('home');
            });
            return Container();
          },
        ),
      ),
    );
  }
}
