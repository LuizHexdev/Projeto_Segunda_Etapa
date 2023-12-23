import 'package:flutter/material.dart';

class UserNotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário Não Encontrado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Usuário não encontrado.'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a tela de login
              },
              child: Text('Tentar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
