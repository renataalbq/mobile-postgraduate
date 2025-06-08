import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'session_manager.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    await SessionManager.clearSession();
    await FirebaseAuth.instance.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Future<void> _checkSessionValidity(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.reload();
      if (user.uid != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sessão válida!')),
        );
      } else {
        await _logout(context);
      }
    } else {
      await _logout(context);
    }
  }

  Future<void> _showToken(BuildContext context) async {
    String? token = await SessionManager.getSessionToken();
    if (token != null && token.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Token: $token')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nenhum token encontrado')),
      );
      await _logout(context);
    }
  }

  Future<void> _deleteToken(BuildContext context) async {
    await SessionManager.clearSession();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Token apagado com sucesso!')),
    );
    await _logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => _checkSessionValidity(context),
          ),
        ],
      ),
      body: Container(
        color: Colors.black12,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _showToken(context),
                child: const Text('Mostrar Token'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _deleteToken(context),
                child: const Text('Apagar Token'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}