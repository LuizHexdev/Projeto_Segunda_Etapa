import 'package:flutter/material.dart';
import 'package:projeto_teste/home_screen.dart';
import 'package:projeto_teste/register_screen.dart';
import 'package:projeto_teste/user_not_found_screen.dart';
 // Importe a classe DatabaseHelper

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nome de usuário'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool isAuthenticated = await authenticateUser(context);

                if (isAuthenticated) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserNotFoundScreen()),
                  );
                }
              },
              child: Text('Entrar'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> authenticateUser(BuildContext context) async {
    // Adicione a lógica para autenticação aqui (verifique no banco de dados)
    // Retorna true se autenticado com sucesso, false caso contrário
    return false;
  }
}
