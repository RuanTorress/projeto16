// drawer_menu.dart
import 'package:flutter/material.dart';
import './loguin.dart';
import './sugestao.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.import_export),
            title: Text('Importar Movimento'),
            onTap: () {
              Navigator.pop(context);
              // Navegar para a tela de Importar Movimento
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Sugestão de Compra'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SugestaoDeComprasScreen(),
                ),
              );
              // Navegar para a tela de Sugestão de Compra
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Cadastros'),
            onTap: () {
              Navigator.pop(context);
              // Navegar para a tela de Cadastros
            },
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('Relatórios'),
            onTap: () {
              Navigator.pop(context);
              // Navegar para a tela de Relatórios
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Controle de Acesso'),
            onTap: () {
              Navigator.pop(context);
              // Navegar para a tela de Controle de Acesso
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
