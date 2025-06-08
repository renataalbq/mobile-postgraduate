import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final LocalAuthentication _localAuth = LocalAuthentication();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _storeEmail(String email) async {
    await _secureStorage.write(key: 'email', value: email);
  }

  Future<String?> _retrieveEmail() async {
    return await _secureStorage.read(key: 'email');
  }

  Future<void> _clearSecureStorage() async {
    await _secureStorage.deleteAll();
  }

  Future<void> _loginWithBiometrics(BuildContext context) async {
    try {
      bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Use sua impressão digital para autenticar',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (isAuthenticated) {
        final email = await _retrieveEmail();
        if (email != null) {
          UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email,
            password: "123456",
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(userCredential.user!)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Nenhum dado salvo para login.")),
          );
        }
      }
    } catch (e) {
      print("Erro na autenticação biométrica: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao autenticar: $e")),
      );
    }
  }

  Future<void> _loginWithEmail(BuildContext context) async {
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      if (!_validateEmail(email) || !_validatePassword(password)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Credenciais inválidas. Verifique email e senha.")),
        );
        return;
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _storeEmail(email);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(userCredential.user!)),
      );
    } catch (e) {
      print("Erro ao logar com email: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro ao autenticar. Tente novamente.")),
      );
    }
  }

  bool _validateEmail(String email) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegExp.hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login ou Registro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _loginWithEmail(context),
              child: const Text("Login com Email"),
            ),
            const SizedBox(height: 16),
            IconButton(
              icon: const Icon(Icons.fingerprint, size: 40, color: Colors.blue),
              onPressed: () => _loginWithBiometrics(context),
            ),
            const Text("Login com Impressão Digital"),
          ],
        ),
      ),
    );
  }
}