import 'package:flutter/material.dart';

class StatusService {
  // Mapeamento de Status para Cores
  static Map<String, Color> statusColors = {
    "Gerado Sugestão": Colors.orange, // Cor para "Gerado Sugestão"
    "Pendente Plataforma": Colors.yellow, // Cor para "Pendente Plataforma"
    "Em Análise Operador": Colors.blue, // Cor para "Em Análise Operador"
    "Em Análise Associado": Colors.green, // Cor para "Em Análise Associado"
    "Pendente de Envio": Colors.red, // Cor para "Pendente de Envio"
    "Finalizado": Colors.grey, // Cor para "Finalizado"
  };

  static List<String> getStatus() {
    return [
      "Gerado Sugestão",
      "Pendente Plataforma",
      "Em Análise Operador",
      "Em Análise Associado",
      "Pendente de Envio",
      "Finalizado"
    ];
  }

  // Exemplo de uma função que retorna os dados de cotação de hoje
  static String getCotacaoHoje() {
    return "Data: ${DateTime.now().toLocal().toString().split(' ')[0]}";
  }
}
