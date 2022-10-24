import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PacienteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              PacienteImage(),
            ],
          )
        ],
      ),
    ));
  }
}
