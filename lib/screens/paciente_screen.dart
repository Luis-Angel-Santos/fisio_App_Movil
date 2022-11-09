import 'package:fisio/providers/paciente_form_provider.dart';
import 'package:fisio/services/services.dart';
import 'package:fisio/ui/input_decorations.dart';
import 'package:fisio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class PacienteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pacienteService = Provider.of<PacienteService>(context);

    return ChangeNotifierProvider(
      create: (_) => PacienteFormProvider(pacienteService.selectedPaciente),
      child: _PacientesScreenBody(pacienteService: pacienteService),
    );
  }
}

class _PacientesScreenBody extends StatelessWidget {
  const _PacientesScreenBody({
    Key? key,
    required this.pacienteService,
  }) : super(key: key);

  final PacienteService pacienteService;

  @override
  Widget build(BuildContext context) {
    final pacienteForm = Provider.of<PacienteFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                PacienteImage(url: pacienteService.selectedPaciente.foto),
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
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {
                      final picker = new ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                          source: ImageSource.camera, imageQuality: 100);

                      if (pickedFile == null) {
                        print('No selecciono ninguna foto');
                        return;
                      }
                      print(
                          'Se cargo la imagen correctamente ${pickedFile.path}');
                      pacienteService
                          .updateSelectedPacienteImage(pickedFile.path);
                    },
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      size: 40,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ],
            ),
            _PacienteForm(),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: () async {
          if (!pacienteForm.isValidForm()) return;
          await pacienteService.saveOrCreatePaciente(pacienteForm.paciente);
        },
      ),
    );
  }
}

class _PacienteForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pacienteForm = Provider.of<PacienteFormProvider>(context);
    final paciente = pacienteForm.paciente;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: pacienteForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: paciente.nombreDelPaciente,
                onChanged: (value) => paciente.nombreDelPaciente = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Nombre del Paciente:', hintText: 'Nombre:'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: paciente.apellidos,
                onChanged: (value) => paciente.apellidos = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'Los apellidos son obligatorios';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Apellidos:', hintText: 'Apellidos:'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: paciente.fecha,
                onChanged: (value) => paciente.fecha = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La fecha es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Fecha:', hintText: 'Ejemplo: 02/11/2022'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: paciente.edad,
                onChanged: (value) => paciente.edad = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La edad es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Edad:', hintText: 'Edad: '),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: paciente.sexo,
                onChanged: (value) => paciente.sexo = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El sexo  es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Sexo:', hintText: 'Masculino o Femenino: '),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: paciente.ocupacion,
                onChanged: (value) => paciente.ocupacion = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La ocupacion es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Ocupacion:', hintText: 'Ejemplo: Estudiante '),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: paciente.estadoCivil,
                onChanged: (value) => paciente.estadoCivil = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El estado civil es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Estado Civil:', hintText: 'Ejemplo: Soltero '),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextFormField(
                  initialValue: paciente.domicilio,
                  onChanged: (value) => paciente.domicilio = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'El domicilio es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Domicilio:',
                      hintText: 'Calle, numero, colonia, estado y municipio '),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: '${paciente.telefono}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  if (int.tryParse(value) == null) {
                    paciente.telefono = 0;
                  } else {
                    paciente.telefono = int.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Numero de telefono', hintText: 'Tel:'),
              ),
              SizedBox(
                height: 30,
              ),
              SwitchListTile.adaptive(
                  value: paciente.available,
                  title: Text('Paciente Activo'),
                  activeColor: Colors.indigo,
                  onChanged: pacienteForm.updateAvailability),

              //TODO: Borrar boton
              // MaterialButton(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10)),
              //     disabledColor: Colors.grey,
              //     elevation: 0,
              //     color: Colors.blueAccent,
              //     child: Container(
              //         padding:
              //             EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              //         child: Text(
              //           'Antecedentes no patologicos',
              //           style: TextStyle(fontSize: 18, color: Colors.white),
              //         )),
              //     onPressed: () => {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => Antecedentes_no()))
              //         }),

              SizedBox(
                height: 30,
              ),
              Text(
                'Antecedentes no patologicos',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.indigo),
              ),
              SizedBox(
                height: 30,
              ),

              TextFormField(
                initialValue: paciente.alimentacion,
                onChanged: (value) => paciente.alimentacion = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El campo de alimentacion es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Alimentacion:',
                    hintText: 'Ejemplo: Huevo 2 dias a la semana '),
              ),

              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: paciente.ejercicio,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Ejercicio:',
                    hintText: 'Ejercicio que realiza el paciente'),
              ),

              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: paciente.pasatiempo,
                onChanged: (value) => paciente.pasatiempo = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La casilla de pasa tiempo es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Pasatiempo:',
                    hintText: 'Ejemplo: jugar futbol '),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: paciente.religion,
                onChanged: (value) => paciente.religion = value,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Religion:', hintText: 'Ejemplo: Crisitiana '),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: paciente.adicciones,
                onChanged: (value) => paciente.adicciones = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El campo de adicciones es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Adicciones(alcohol, drogas, tabaco):',
                    hintText: 'Ejemplo: Si, 2 meses con alcoholismo'),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]);
}


// class Antecedentes_no extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
