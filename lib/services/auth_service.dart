import 'dart:convert';
import 'package:firebase_dart/firebase_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'package:localstorage/localstorage.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyAz0tXiFZ4T8WP9clEA9KFJ6E9BVOE0pag';
  final LocalStorage localStorage = new LocalStorage('idUser');
  final storage = FlutterSecureStorage();
  final db = FirebaseFirestore.instance;
  String idUser = '';
  String idExpediente = '';
  List expediente = [];

// Si retornamos algo es un error, si no, todo bien
  Future<String?> createUser(String email, String password) async {
    
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodeResp['idToken']);
      // return decodeResp['idToken'];
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }


  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});
    try {
      final resp = await http.post(url, body: json.encode(authData));
      final Map<String, dynamic> decodeResp = json.decode(resp.body);
      idUser = decodeResp['localId'];
      final docRef = db.collection("pacientes").doc(decodeResp['localId']);
      localStorage.setItem('idUser', decodeResp['localId']);
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data();
          //idExpediente = doc['expedienteMedico'];
          //expediente.add(idExpediente);
          localStorage.setItem('idExpediente', doc['expedienteMedico']);
        },
        onError: (e) => print("Error getting document: $e"),
      );
      idUser = await localStorage.getItem('idUser');
      idExpediente = await localStorage.getItem('idExpediente');
      //print('Expediente $expediente');
      //print('id: $idExpediente');

      //print(localStorage.getItem('idUser'));
      if (decodeResp.containsKey('idToken')) {
        //   // Token hay que guardarlo en un lugar seguro
        // return decodeResp['idToken'];
        //await storage.write(key: 'token', value: decodeResp['idToken']);
        return null;
      } else {
        return decodeResp['error']['message'];
      }
    } catch (e) {
      return 'Parece que hay un problema con la conexión. Por favor intente de nuevo';
    }
    
  }

  Future logout() async {
    await storage.delete(key: 'token');
    await localStorage.deleteItem('idExpediente');
    await localStorage.deleteItem('idUser');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }

  Future<String> readIdUser() async {
    return await localStorage.getItem('idUser');
  }
}
