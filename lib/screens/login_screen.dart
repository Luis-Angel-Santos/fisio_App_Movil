import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.red,
        ),
      ),
    );
  }
}
