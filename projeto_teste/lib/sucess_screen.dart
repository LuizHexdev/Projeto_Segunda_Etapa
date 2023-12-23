import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário Criado com Sucesso'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Usuário criado com sucesso.'),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/'), // Remove todas as rotas até a raiz
                );
              },
              child: Text('Voltar para o Login'),
            ),
          ],
        ),
      ),
    );
  }
}
