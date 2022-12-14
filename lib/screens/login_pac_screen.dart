import 'dart:async';

import 'package:fisio/providers/login_form_provider.dart';
import 'package:fisio/screens/home_pac_screen.dart';
import 'package:fisio/services/services.dart';
import 'package:fisio/ui/input_decorations.dart';
import 'package:fisio/widgets/auth_bground_alt.dart';
import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreenPacientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundAlt(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 200),
            CardContainer(
                child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'Inicia Sesión',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 20),
                ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(), child: _LoginForm()),
              ],
            )),
            SizedBox(height: 30),
            
          ],
        )),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'yourname@example.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.email_rounded),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El correo no es correcto';
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '******',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.blueAccent,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere...' : 'Ingresar',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                         final authservice = Provider.of<AuthService>(context, listen: false);

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        await Future.delayed(Duration(seconds: 2));

                         //Validación login correcto
                        final String? errorMessage = await authservice.login(
                            loginForm.email, loginForm.password);                    
                        if (errorMessage == null) {
                          loginForm.isLoading = false;
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => HomePaciente(idUser: authservice.idUser, idExpediente: authservice.idExpediente)));
                        } else {
                          // print(errorMessage);
                          loginForm.isLoading = false;
                          NotificationsService.showSnackbar(errorMessage);
                        }
                      }),
              SizedBox(
                height: 30,
              ),
              Text('Recuerda que tu contraseña es tu número celular proporcionado al medico'),
          ],
        ),
      ),
    );
  }
}
