import 'package:flutter/material.dart';
import 'drawer_menu.dart'; // Certifique-se de que o caminho está correto
import 'models/transaction.dart';
import './models/custom_body.dart'; // Corrigir o caminho de importação

void main() {
  runApp(MyApp());
}

// menu do lado esquerdo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo com Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}
// pagiga de importação

class _HomePageState extends State<HomePage> {
  Transaction transaction = Transaction(
    description: 'Informações importadas',
    amount: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Importar dados'),
      ),
      drawer: DrawerMenu(), // Utiliza a classe DrawerMenu
      body: MyForm(), // Alterado para utilizar DatePickerExample
    );
  }
}
