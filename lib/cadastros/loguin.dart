import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo com cor ou gradiente
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Color.fromARGB(255, 54, 90, 153)],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Caminho da sua imagem
                  // Texto acima do card
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Datarey Central de Compras',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      width: 500, // Largura ajustada do card
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Título de Bem-vindo
                          Text(
                            'Bem-vindo!',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: 12),

                          // Campo de usuário com ícone
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Usuário',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                          SizedBox(height: 12),

                          // Campo de senha com ícone
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                            ),
                          ),
                          SizedBox(height: 12),

                          // Botão Entrar
                          ElevatedButton(
                            onPressed: () {
                              // Lógica de login pode ser adicionada aqui
                              print('Login realizado!');
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(200,
                                  50), // Largura fixa de 200 e altura de 50
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      15), // Espaçamento interno (vertical)
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Cantos arredondados
                              ),
                            ),
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 19,
                                color: const Color.fromARGB(255, 245, 246, 248),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
