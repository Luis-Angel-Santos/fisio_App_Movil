import 'dart:convert';
import 'dart:io';

import 'package:fisio/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class PacienteUserService extends ChangeNotifier {
  final String _baseUrl = 'fisio-7c2ac-default-rtdb.firebaseio.com';
  final List<PacienteUser> pacientes_user = [];
  late PacienteUser selectedPaciente;

  final storage = new FlutterSecureStorage();

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  PacienteUserService() {
    this.loadPacientesUser();
  }

  Future loadPacientesUser() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'PacienteUser.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.get(url);

    final Map<String, dynamic> pacientesUserMap = json.decode(resp.body);

    pacientesUserMap.forEach((key, value) {
      final tempPacienteUser = PacienteUser.fromMap(value);
      tempPacienteUser.id = key;
      this.pacientes_user.add(tempPacienteUser);
    });

    this.isLoading = false;
    notifyListeners();
    return this.pacientes_user;
  }

  Future saveOrCreatePaciente(PacienteUser paciente_user) async {
    isSaving = true;
    notifyListeners();

    if (paciente_user.id == null) {
      //Es necesario crear
      await this.createPaciente(paciente_user);
    } else {
      await this.updatePaciente(paciente_user);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updatePaciente(PacienteUser paciente_user) async {
    final url = Uri.https(_baseUrl, 'PacienteUser/${paciente_user.id}.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.put(url, body: paciente_user.toJson());
    final decodeData = resp.body;

    //TODO:Actualizar la lista de pacientes
    final index =
        this.pacientes_user.indexWhere((element) => element.id == paciente_user.id);
    this.pacientes_user[index] = paciente_user;

    return paciente_user.id!;
  }

  Future<String> createPaciente(PacienteUser paciente_user) async {
    final url = Uri.https(_baseUrl, 'PacienteUser.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.post(url, body: paciente_user.toJson());
    final decodeData = json.decode(resp.body);

    paciente_user.id = decodeData['name'];
    this.pacientes_user.add(paciente_user);

    return paciente_user.id!;
  }

  void updateSelectedPacienteImage(String path) {
    this.selectedPaciente.foto = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/drxbjcwsz/image/upload?upload_preset=iwrvzlj0');

    final fotoUploadRequest = http.MultipartRequest('POST', url);

    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    fotoUploadRequest.files.add(file);

    final streamResponse = await fotoUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salió mal');
      print(resp.body);
      return null;
    }

    this.newPictureFile = null;

    final decodedData = json.decode(resp.body);

    //TODO:borrar esta linea de codigo
    return decodedData['secure_url'];
  }
}
