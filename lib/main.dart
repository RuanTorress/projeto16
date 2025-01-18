import 'package:flutter/material.dart';
import 'models/transaction.dart';
import './models/custom_body.dart';
import './navegacao_lateral/nav_pagina.dart';
import 'package:google_fonts/google_fonts.dart';
import './navegacao_lateral/navegacao_lateral.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          iconTheme: const IconThemeData(size: 22),
        ),
        title: 'Central de compras',
        home: NavegacaoLateral(constraints: constraints),
      ),
    );
  }
}
