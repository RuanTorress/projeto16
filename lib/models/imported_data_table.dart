import 'package:flutter/material.dart';

class ImportedDataTable extends StatelessWidget {
  final List<Map<String, String>> importedData;

  ImportedDataTable({required this.importedData});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
