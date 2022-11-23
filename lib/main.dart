import 'package:fisio/screens/receta_detail.dart';
import 'package:fisio/screens/screens.dart';
import 'package:fisio/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => PacienteService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FISIO App',
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginScreen(),
          'register': (_) => RegisterScreen(),
          'home': (_) => HomeScreen(),
          'paciente': (_) => PacienteScreen(),
          'login_paciente': (_) => LoginScreenPacientes(),
          'perfil_paciente': (_) => ProfilePaciente(),
          'home_paciente': (_) => HomePaciente(),
          'receta_detail': (_) => RecetaDetail(),
          'checking': (_) => CheckAuthScreen(),
        },
        scaffoldMessengerKey: NotificationsService.messengerKey,
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.grey[300],
            appBarTheme: AppBarTheme(elevation: 0, color: Colors.indigo),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.indigo, elevation: 0)));
  }
}
