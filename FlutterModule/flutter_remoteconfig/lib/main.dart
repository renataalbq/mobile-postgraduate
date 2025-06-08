import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _corPrincipal = Colors.blue;
  String _boasVindas = "Carregando...";

  @override
  void initState() {
    super.initState();
    _carregaRemoteConfig();
  }

  Future<void> _carregaRemoteConfig() async {
    try {

      final remoteConfig = FirebaseRemoteConfig.instance;

      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(minutes: 1),
      ));

      await remoteConfig.fetchAndActivate();

      setState(() {
        final colorHex = remoteConfig.getString('cor_primaria');
        _corPrincipal = _hexToColor(colorHex);
        _boasVindas = remoteConfig.getString('boas_vindas');
      });
    } catch (e) {
      print("Erro ao carregar Remote Config: $e");
    }
  }

  Color _hexToColor(String hexCode) {
    return Color(int.parse(hexCode.replaceFirst('#', '0xFF')));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: _corPrincipal),
      home: Scaffold(
        appBar: AppBar(title: const Text("Teste do Remote Config")),
        body: Container(
          color: _corPrincipal,
          child: Center(
            child: Text(
              _boasVindas,
              style: const TextStyle(
                  color:Colors.white,
                  fontSize: 30,
              fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}