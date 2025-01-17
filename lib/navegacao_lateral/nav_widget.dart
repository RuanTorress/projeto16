import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Header da navegação lateral.
/// Possui logo da empresa e a opção de minimizar a navegação.
///
/// Aparece apenas se a navegação estiver maximizada, caso contrário segue
/// a composição de uma coluna normal.
class HeaderNavegacaoLateral extends StatefulWidget {
  final bool showNavBar;
  final Function minimizaNavegacao;

  const HeaderNavegacaoLateral({
    super.key,
    required this.showNavBar,
    required this.minimizaNavegacao,
  });

  @override
  State<HeaderNavegacaoLateral> createState() => _HeaderNavegacaoLateralState();
}

class _HeaderNavegacaoLateralState extends State<HeaderNavegacaoLateral> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.showNavBar,

      // Se a navegação estiver minimizda.
      replacement: Column(
        children: [
          IconButton(
            onPressed: () => widget.minimizaNavegacao(),
            icon: const Icon(Icons.arrow_right_sharp),
          ),
          const Image(
            image: AssetImage('images/logo_datarey_min.png'),
            height: 50,
          ),
        ],
      ),

      // Se estiver a navegação estiver maximizada.
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image(
                  image: AssetImage('images/logo_datarey.png'),
                  height: 60,
                ),
              ),
            ],
          ),
          Positioned(
            top: -10,
            right: 1,
            child: IconButton(
              onPressed: () => widget.minimizaNavegacao(),
              icon: const Icon(Icons.arrow_left_sharp),
            ),
          ),
        ],
      ),
    );
  }
}

/// ListTile com a opção de sair da conta.
/// Muda o texto de cor quando o mouse estiver por cima e mostra apenas o ícone quando a navegação é minimizada.
class SairDaConta extends StatefulWidget {
  final bool showNavBar;

  const SairDaConta({
    super.key,
    required this.showNavBar,
  });

  @override
  State<SairDaConta> createState() => _SairDaContaState();
}

class _SairDaContaState extends State<SairDaConta> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // Enquanto o mouse estiver em cima do "Sair da conta", transforma o texto e o ícone em vermelho.
      onHover: (_) {
        setState(() {
          onHover = true;
        });
      },
      // Quando o mouse sair de cima do "Sair da conta", deixa as cores como estava antes.
      onExit: (_) {
        setState(() {
          onHover = false;
        });
      },
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.exit_to_app,
              color: onHover ? Colors.red : null,
            ),
            Visibility(
              visible: widget.showNavBar,
              child: const Gap(15),
            ),
            Visibility(
              visible: widget.showNavBar,
              child: Text(
                'Sair da conta',
                style: TextStyle(
                  fontSize: 14,
                  color: onHover ? Colors.red : null,
                ),
              ),
            ),
          ],
        ),
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        splashColor: Colors.transparent,
        onTap: () {}, // Colocar função para sair da conta.
      ),
    );
  }
}
