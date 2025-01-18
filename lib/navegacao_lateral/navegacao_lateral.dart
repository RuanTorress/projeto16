import '../importa_movimentos/importa_movimento.dart';
import 'package:central_compras/navegacao_lateral/nav_pagina.dart';
import 'package:central_compras/navegacao_lateral/nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Navegação lateral que apresenta opções para troca de página.
///
/// A página selecionada pelo usuário é mostrada dentro da Row, que separa
/// a navegação da página escolhida.
///
class NavegacaoLateral extends StatefulWidget {
  final BoxConstraints constraints;

  const NavegacaoLateral({
    super.key,
    required this.constraints,
  });

  @override
  State<NavegacaoLateral> createState() => _NavegacaoLateralState();
}

class _NavegacaoLateralState extends State<NavegacaoLateral> {
  // Controla se a navegação está ou não minimizada.
  bool showNavBar = true;

  // Páginas acessadas pela navegação.
  final paginasNavegacao = PaginaNav.paginasNavegacao;

  // Página atual que está sendo exibida. Por padrão inicia com a Importa movimento.
  Widget paginaAtual = const ImportaMovimento();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            backgroundColor: Colors.white,
            width: showNavBar ? 250 : 72,
            shape: const BeveledRectangleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      HeaderNavegacaoLateral(
                        showNavBar: showNavBar,
                        minimizaNavegacao: minimizaNavegacao,
                      ),
                      Visibility(
                        visible: showNavBar,
                        child: const Gap(20),
                      ),

                      // Páginas para navegação.
                      // Utiliza da lista da lista de páginas informada em navegacao_lateral/pagina_nav.dart
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: paginasNavegacao.length,
                        separatorBuilder: (context, index) => const Gap(10),
                        itemBuilder: (context, index) {
                          PaginaNav pagina = paginasNavegacao[index];

                          return Container(
                            decoration: BoxDecoration(
                              color: pagina.selecionado
                                  ? const Color.fromARGB(20, 33, 149, 243)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Visibility(
                                visible: pagina.selecionado,
                                replacement: Icon(pagina.icone),
                                child: Icon(pagina.iconeSelecionado),
                              ),
                              title: Visibility(
                                visible: showNavBar,
                                child: Text(
                                  pagina.titulo,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                              selected: pagina.selecionado,
                              selectedColor: Colors.blue,
                              onTap: () => selecionaPagina(pagina),
                              contentPadding: const EdgeInsets.only(left: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              splashColor: Colors.transparent,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SairDaConta(showNavBar: showNavBar),
                ],
              ),
            ),
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),

          // Página atual em exibição.
          Expanded(child: paginaAtual),
        ],
      ),
    );
  }

  /// Minimiza ou maximiza a navegação lateral.
  void minimizaNavegacao() {
    setState(() {
      showNavBar = !showNavBar;
    });
  }

  /// Mostra a página selecionada.
  /// Primeiro deixa todas as páginas com selecionado = false e depois coloca apenas a página selecionada como true.
  void selecionaPagina(PaginaNav pagina) {
    for (var p in paginasNavegacao) {
      p.selecionado = false;
    }

    setState(() {
      pagina.selecionado = true;
      paginaAtual = pagina.pagina;
    });
  }
}
