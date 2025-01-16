import 'package:flutter/material.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  String? selectedCode;
  String? selectedPeriod;
  String? selectedRegion;
  String? selectedFilter;

  String? clientCpfCnpj;
  String? selectedStatus;
  bool isFiltered = false;

  // Variáveis de data
  DateTime? selectedDate;

  // Função para selecionar uma única data
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.shopping_cart),
            SizedBox(width: 8),
            Text('Sugestão de compras - Histórico'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Primeira linha (Container + Column)
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Row para os 7 elementos, com flexíveis para ajustar os campos
                  Row(
                    children: [
                      // 1. Código Sugestão
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Selecionar'),
                            const SizedBox(
                                height: 3), // Espaçamento entre título e campo
                            TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          8)), // Arredondando as bordas
                                ),
                                hintText: "Selecione o cliente",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      // 2. Período
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Período'),
                            GestureDetector(
                              onTap: _selectDate,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 14),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Data com ícone
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          selectedDate != null
                                              ? selectedDate!
                                                  .toString()
                                                  .substring(0, 10)
                                              : "Selecione",
                                          style: const TextStyle(fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      // 3. Tipo de Região
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Título
                            Text(
                              "Tipo de região",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height:
                                    8), // Espaçamento entre o título e o Dropdown

                            // Dropdown estilizado
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200], // Fundo do dropdown
                                borderRadius: BorderRadius.circular(
                                    8), // Bordas arredondadas
                                border: Border.all(
                                    color: Colors.grey), // Borda fina
                              ),
                              child: DropdownButton<String>(
                                hint: Text("Selecione"),
                                value: selectedFilter,
                                underline:
                                    SizedBox(), // Remove a linha padrão do Dropdown
                                isExpanded:
                                    true, // Garante que o dropdown ocupe o espaço total
                                items: <String>[
                                  'Região Demográfica',
                                  'Mesorregião',
                                  'Microrregião',
                                  'Cidade',
                                  'Região da Cidade',
                                  'Bairro',
                                  'Logradouro'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedFilter = newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 16),
                      // 4. Região
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Título
                            Text(
                              "Região",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height:
                                    8), // Espaçamento entre o título e o Dropdown

                            // Dropdown para seleção de região
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: DropdownButton<String>(
                                hint: Text("Selecione Região"),
                                value: selectedRegion,
                                underline:
                                    SizedBox(), // Remove a linha padrão do Dropdown
                                isExpanded:
                                    true, // Garante que o dropdown ocupe o espaço total
                                items: selectedFilter != null
                                    ? ['Região 1', 'Região 2', 'Região 3']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList()
                                    : [],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedRegion = newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 16),
                      // 5. Cliente (CPF ou CNPJ)
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Título do campo
                            Text(
                              'Cliente (CPF ou CNPJ)',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height:
                                    8), // Espaçamento entre o título e o campo

                            // Campo de entrada estilizado
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200], // Fundo cinza claro
                                borderRadius: BorderRadius.circular(
                                    10), // Bordas arredondadas
                                border: Border.all(
                                    color: Colors.grey), // Borda cinza fina
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    clientCpfCnpj = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  border:
                                      InputBorder.none, // Remove a borda padrão
                                  hintText:
                                      'Digite CPF ou CNPJ', // Placeholder do campo
                                  hintStyle: TextStyle(
                                      color: Colors
                                          .grey[600]), // Estilo do placeholder
                                ),
                                keyboardType: TextInputType
                                    .number, // Define o teclado numérico
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 16),
                      // 6. Situação
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Título do campo
                            Text(
                              'Situação',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height:
                                    8), // Espaçamento entre o título e o campo

                            // Campo de entrada estilizado
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200], // Fundo cinza claro
                                borderRadius: BorderRadius.circular(
                                    10), // Bordas arredondadas
                                border: Border.all(
                                    color: Colors.grey), // Borda cinza fina
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border:
                                      InputBorder.none, // Remove a borda padrão
                                  hintText:
                                      'Ex: Finalizado', // Placeholder do campo
                                  hintStyle: TextStyle(
                                      color: Colors
                                          .grey[600]), // Estilo do placeholder
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedStatus = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 16),
                      // 7. Botão: Aplicar Filtro
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isFiltered = true;
                            });
                          },
                          child: Text('Aplicar Filtro'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Colors.blue,
                            textStyle: TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Se o filtro for aplicado, exibe a planilha de resultados
            if (isFiltered)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: DataTable(
                      columnSpacing: 16.0,
                      horizontalMargin: 10.0,
                      dataRowHeight: 60.0,
                      headingRowHeight: 56.0,
                      border: TableBorder(
                        horizontalInside: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        verticalInside: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        top: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        left: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        right: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      columns: [
                        DataColumn(
                            label: Text('cod.sugestão',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('razão social',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('nome fantasia',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('cnpj',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Qt.total',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Vr.total',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('data',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('horário',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('status',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('visualizar',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: List.generate(5, (index) {
                        return DataRow(
                          cells: [
                            DataCell(Text('12345')),
                            DataCell(Text('Razão Social $index')),
                            DataCell(Text('Nome Fantasia $index')),
                            DataCell(Text('00.000.000/0000-00')),
                            DataCell(Text('10')),
                            DataCell(Text('R\$ 1000,00')),
                            DataCell(Text('01/01/2025')),
                            DataCell(Text('10:00')),
                            DataCell(Text('Finalizado')),
                            DataCell(Icon(Icons.search)),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Historico(),
  ));
}
