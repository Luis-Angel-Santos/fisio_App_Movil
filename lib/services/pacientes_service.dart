import 'dart:convert';
import 'dart:io';

import 'package:fisio/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class PacienteService extends ChangeNotifier {
  final String _baseUrl = 'https://fisioapp-73d11-default-rtdb.firebaseio.com/';
  final List<Paciente> pacientes = [];
  late Paciente selectedPaciente;
  final db = FirebaseFirestore.instance;
  final LocalStorage localStorage = new LocalStorage('idUser');

  final storage = new FlutterSecureStorage();

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  PacienteService() {
    this.loadPacientes();
  }

  //TODO: <List<Paciente>>
  Future loadPacientes() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'Paciente.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.get(url);

    final Map<String, dynamic> pacientesMap = json.decode(resp.body);

    pacientesMap.forEach((key, value) {
      final tempPaciente = Paciente.fromMap(value);
      tempPaciente.id = key;
      this.pacientes.add(tempPaciente);
    });

    this.isLoading = false;
    notifyListeners();
    return this.pacientes;
  }

  Future saveOrCreatePaciente(Paciente paciente) async {
    isSaving = true;
    notifyListeners();

    if (paciente.id == null) {
      //Es necesario crear
      await this.createPaciente(paciente);
    } else {
      await this.updatePaciente(paciente);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updatePaciente(Paciente paciente) async {
    final url = Uri.https(_baseUrl, 'Paciente/${paciente.id}.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.put(url, body: paciente.toJson());
    final decodeData = resp.body;

    //TODO:Actualizar la lista de pacientes
    final index =
        this.pacientes.indexWhere((element) => element.id == paciente.id);
    this.pacientes[index] = paciente;

    return paciente.id!;
  }

  Future<String> createPaciente(Paciente paciente) async {
    final url = Uri.https(_baseUrl, 'Paciente.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.post(url, body: paciente.toJson());
    final decodeData = json.decode(resp.body);

    paciente.id = decodeData['name'];
    this.pacientes.add(paciente);

    return paciente.id!;
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
      print('algo salio mal');
      print(resp.body);
      return null;
    }

    this.newPictureFile = null;

    final decodedData = json.decode(resp.body);

    //TODO:borrar esta linea de codigo
    return decodedData['secure_url'];
  }

  getInfoPaciente(){
    final id = localStorage.getItem('idUser');
    final docRef = db.collection("pacientes").doc(id);
    docRef.snapshots().listen(
      (event) {
        final source = (event.metadata.hasPendingWrites) ? "Local" : "Server";
        print("$source data: ${event.data()}");
      },
      onError: (error) => print("Listen failed: $error"),
    );
  }
}
