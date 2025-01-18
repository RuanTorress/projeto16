import 'package:flutter/material.dart';

class ImportedDataTable extends StatelessWidget {
  final List<Map<String, String>> importedData;

  ImportedDataTable({required this.importedData});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Tabela rolável horizontalmente
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 16.0, // Espaçamento entre as colunas
                headingRowColor: MaterialStateProperty.all(const Color.fromARGB(
                    255, 171, 169, 169)), // Cor do cabeçalho
                headingTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ), // Estilo do texto do cabeçalho
                dataTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ), // Estilo do texto das células
                columns: const [
                  DataColumn(label: Text('Código')),
                  DataColumn(label: Text('Razão Social')),
                  DataColumn(label: Text('Nome Fantasia')),
                  DataColumn(label: Text('CNPJ')),
                  DataColumn(label: Text('Qtd. Entrada')),
                  DataColumn(label: Text('Total Entrada')),
                  DataColumn(label: Text('Qtd. Saída')),
                  DataColumn(label: Text('Total Saída')),
                  DataColumn(label: Text('Associado')), // Coluna "Associado"
                  DataColumn(label: Text('Data')) // Nova coluna "Data"
                ],
                rows: importedData.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, String> data = entry.value;

                  return DataRow(
                    color: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        // Alterna cores para efeito zebra
                        return index.isEven ? Colors.grey[200] : null;
                      },
                    ),
                    cells: [
                      DataCell(Text(data['Código'] ?? '')),
                      DataCell(Text(data['Razão Social'] ?? '')),
                      DataCell(Text(data['Nome Fantasia'] ?? '')),
                      DataCell(Text(data['CNPJ'] ?? '')),
                      DataCell(Text(data['Qtd. Entrada'] ?? '')),
                      DataCell(Text(data['Total Entrada'] ?? '')),
                      DataCell(Text(data['Qtd. Saída'] ?? '')),
                      DataCell(Text(data['Total Saída'] ?? '')),
                      DataCell(Text(data['Associado'] ?? '')),
                      DataCell(Text(data['Data'] ?? '')), // Exibe a data
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
=======
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Código')),
              DataColumn(label: Text('Razão Social')),
              DataColumn(label: Text('Nome Fantasia')),
              DataColumn(label: Text('CNPJ')),
              DataColumn(label: Text('Qtd. Entrada')),
              DataColumn(label: Text('Total Entrada')),
              DataColumn(label: Text('Qtd. Saída')),
              DataColumn(label: Text('Total Saída')),
              DataColumn(label: Text('Associado')),
            ],
            rows: importedData.map((data) {
              return DataRow(
                cells: [
                  DataCell(Text(data['Código'] ?? '')),
                  DataCell(Text(data['Razão Social'] ?? '')),
                  DataCell(Text(data['Nome Fantasia'] ?? '')),
                  DataCell(Text(data['CNPJ'] ?? '')),
                  DataCell(Text(data['Qtd. Entrada'] ?? '')),
                  DataCell(Text(data['Total Entrada'] ?? '')),
                  DataCell(Text(data['Qtd. Saída'] ?? '')),
                  DataCell(Text(data['Total Saída'] ?? '')),
                  DataCell(Text(data['Associado'] ?? '')),
                ],
              );
            }).toList(),
          ),
        ),
      ],
>>>>>>> c133d806e1e8f2e9a3a00d2e0ea54b68018697d8
    );
  }
}
