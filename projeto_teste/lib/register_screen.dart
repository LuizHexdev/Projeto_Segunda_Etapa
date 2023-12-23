import 'package:flutter/material.dart';
import 'package:projeto_teste/database_helper.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await DatabaseHelper().insertUser({
                  'username': usernameController.text,
                  'email': emailController.text,
                  'password': passwordController.text,
                });

                // Redireciona o usuário para a tela de login após o cadastro
                Navigator.pop(context); // Volta para a tela anterior (que deve ser a tela de login)
              },
              child: Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
