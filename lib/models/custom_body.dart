import 'package:flutter/material.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTimeRange? selectedDateRange;
  bool isDataImported = false;

//data

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2310),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDateRange = DateTimeRange(start: pickedDate, end: pickedDate);
      });
    }
  }

  void _importData() {
    setState(() {
      isDataImported = true;
    });
  }

// definiçoes do layton aqui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Alinha os itens à esquerda
          children: const [
            Icon(Icons.cloud_upload), // Ícone do lado esquerdo
            SizedBox(width: 8), // Espaçamento entre o ícone e o texto
            Text('Importar Dados'), // Texto
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Definir a altura da linha
          child: Divider(
            thickness: 1, // Espessura da linha
            color: Colors.grey, // Cor da linha
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSingleLineFields(), // Fica fora do Container, mas dentro do Padding
            const SizedBox(height: 16),

            // Espaçamento
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100], // Cor de fundo
                border: Border.all(
                  color: Colors.grey, // Cor da borda
                  width: 2.0, // Largura da borda
                ),
                borderRadius: BorderRadius.circular(
                    8.0), // Bordas arredondadas (opcional)
              ),
              child: Column(
                children: [
                  if (isDataImported) ...[
                    _buildImportedInfoAndSearch(), // Exibe quando isDataImported for true
                    _buildSpreadsheetTable(), // Exibe quando isDataImported for true
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleLineFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Campo de seleção de data
        // O Flexible ajuda a controlar como cada widget se ajusta dentro desse espaço, especialmente se o conteúdo for muito grande ou pequeno.
        Flexible(
          flex: 1, // Flex reduzido para 1
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinha o título à esquerda
            children: [
              const Text('Período'),
              GestureDetector(
                onTap: _selectDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 14), // Reduzido o padding
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Data de início com ícone
                      Row(
                        mainAxisSize:
                            MainAxisSize.min, // Removido o uso de Flexible aqui
                        children: [
                          const Icon(Icons.calendar_today,
                              size: 18, color: Colors.grey), // Ícone menor
                          const SizedBox(width: 6), // Menor espaçamento
                          Text(
                            selectedDateRange != null
                                ? selectedDateRange!.start
                                    .toString()
                                    .substring(0, 10)
                                : "Início",
                            style: const TextStyle(fontSize: 14), // Texto menor
                            overflow:
                                TextOverflow.ellipsis, // Trunca texto longo
                          ),
                        ],
                      ),

                      // Separador (traço entre as datas)
                      const Text("-",
                          style: TextStyle(fontSize: 14)), // Texto menor

                      // Data de fim com ícone
                      Row(
                        mainAxisSize:
                            MainAxisSize.min, // Removido o uso de Flexible aqui
                        children: [
                          Text(
                            selectedDateRange != null
                                ? selectedDateRange!.end
                                    .toString()
                                    .substring(0, 10)
                                : "Fim",
                            style: const TextStyle(fontSize: 14), // Texto menor
                            overflow:
                                TextOverflow.ellipsis, // Trunca texto longo
                          ),
                          const SizedBox(width: 6), // Menor espaçamento
                          const Icon(Icons.calendar_today,
                              size: 18, color: Colors.grey), // Ícone menor
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),
        // Campo de seleção de cliente
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinha o título à esquerda
            children: [
              const Text('Selecionar'),
              const SizedBox(height: 3), // Espaçamento entre título e campo
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8)), // Arredondando as bordas
                  ),
                  hintText: "Selecione o cliente",
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),
        // Filtro e botão
        Flexible(
          flex: 3,
          child: Row(
            children: [
              const SizedBox(width: 8),
              Checkbox(
                value: true,
                onChanged: (bool? value) {},
              ),

              const Text(
                "Somente associados:",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),

              const SizedBox(width: 350), // espaçamento entre os elementos
              ElevatedButton.icon(
                onPressed: _importData,
                icon: const Icon(
                  Icons.cloud_upload,
                  size: 30, // Aumenta o tamanho do ícone
                ),
                label: const Text(
                  "Importar",
                  style: TextStyle(fontSize: 18), // Aumenta o tamanho da fonte
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 4, 141, 253), // Cor de fundo
                  minimumSize:
                      Size(300, 50), // Aumenta a largura e altura do botão
                  padding: EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12), // Aumenta o padding
                  textStyle:
                      TextStyle(fontSize: 18), // Aumenta o tamanho do texto
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImportedInfoAndSearch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          // Linha acima
          color: Colors.grey, // Cor da linha
          thickness: 1.0, // Espessura da linha
          indent: 0, // Espaço à esquerda
          endIndent: 0, // Espaço à direita
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Informações Importadas",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Pesquisar Cliente",
                ),
              ),
            ),
          ],
        ),
        const Divider(
          // Linha abaixo
          color: Colors.grey, // Cor da linha
          thickness: 1.0, // Espessura da linha
          indent: 0, // Espaço à esquerda
          endIndent: 0, // Espaço à direita
        ),
      ],
    );
  }

  Widget _buildSpreadsheetTable() {
    List<String> fields = [
      "Código",
      "Razão social",
      "Nome fantasia",
      "CNPJ",
      "Qtd, entrada",
      "Total entrada",
      "Qtd, saída",
      "Total saída",
      "Associado",
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Rolagem horizontal para colunas
      child: Container(
        width:
            MediaQuery.of(context).size.width * 0.9, // 90% da largura da tela
        padding: EdgeInsets.symmetric(
            horizontal: 16.0), // Espaçamento à esquerda e à direita
        child: DataTable(
          columnSpacing: 16.0, // Espaçamento entre as colunas
          horizontalMargin: 10.0, // Margem horizontal
          dataRowHeight: 60.0, // Altura das linhas
          headingRowHeight: 56.0, // Altura do cabeçalho
          border: TableBorder(
            horizontalInside: BorderSide(
              color: Colors.grey, // Cor da borda entre as linhas
              width: 1.0, // Largura da borda
            ),
            verticalInside: BorderSide(
              color: Colors.grey, // Cor da borda entre as colunas
              width: 1.0, // Largura da borda
            ),
            top: BorderSide(
              color: Colors.grey, // Cor da borda superior
              width: 1.0, // Largura da borda
            ),
            bottom: BorderSide(
              color: Colors.grey, // Cor da borda inferior
              width: 1.0, // Largura da borda
            ),
            left: BorderSide(
              color: Colors.grey, // Cor da borda esquerda
              width: 1.0, // Largura da borda
            ),
            right: BorderSide(
              color: Colors.grey, // Cor da borda direita
              width: 1.0, // Largura da borda
            ),
          ),
          columns: fields.map((field) {
            return DataColumn(
              label: Center(
                child: Text(
                  field,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
          rows: List.generate(
            5, // Gerando 5 linhas de dados
            (index) => DataRow(
              cells: fields
                  .map(
                    (field) => DataCell(
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                              8.0), // Espaçamento interno nas células
                          child: Text(
                            'Valor $field', // Substitua com dados reais
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
