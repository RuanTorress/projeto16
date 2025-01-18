import '../cadastros/cadastros.dart';
import '../controle_acesso/controle_acesso.dart';
import '../importa_movimentos/importa_movimento.dart';
import '../relatorios/relatorios.dart';
import '../sugestao_compras/sugestao.dart';
import 'package:flutter/material.dart';
import '../models/custom_body.dart';
import '../cadastros/loguin.dart';

/// Opções de página que aparecem na barra de navegação.
///
/// Para adicionar uma nova página, basta criar um novo objeto PaginaNav na lista "paginasNavegacao"
/// e informar os parâmetros requiridos.
///
/// Os objetos instanciados nessa lista aparecerão no ListView da barra de navegação.
///
class PaginaNav {
  final String titulo;
  final IconData icone;
  final IconData iconeSelecionado;
  final Widget pagina;
  bool selecionado;

  PaginaNav({
    required this.titulo,
    required this.icone,
    required this.iconeSelecionado,
    required this.pagina,
    this.selecionado = false, // Caso true, deixa o texto em azul.
  });

  static List<PaginaNav> paginasNavegacao = [
    PaginaNav(
      titulo: 'Importa movimento',
      icone: Icons.cloud_sync_outlined,
      iconeSelecionado: Icons.cloud_sync,
<<<<<<< HEAD
      pagina: const MyForm(),
=======
      pagina: const Relatorios(),
>>>>>>> c133d806e1e8f2e9a3a00d2e0ea54b68018697d8
      selecionado: true, // Inicia com essa página selecionada.
    ),
    PaginaNav(
      titulo: 'Sugestão de compra',
      icone: Icons.shopping_cart_outlined,
      iconeSelecionado: Icons.shopping_cart,
      pagina: const SugestaoDeComprasScreen(),
    ),
    PaginaNav(
      titulo: 'Cadastros',
      icone: Icons.library_books_outlined,
      iconeSelecionado: Icons.library_books,
      pagina: const LoginPage(),
    ),
    PaginaNav(
      titulo: 'Relatórios',
      icone: Icons.insert_chart_outlined_outlined,
      iconeSelecionado: Icons.insert_chart,
      pagina: const Relatorios(),
    ),
    PaginaNav(
      titulo: 'Controle de acesso',
      icone: Icons.lock_outline,
      iconeSelecionado: Icons.lock,
      pagina: const ControleAcesso(),
    )
  ];
}
