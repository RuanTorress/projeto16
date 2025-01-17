import 'package:flutter/material.dart';

// Classe GerarCotacao
class GerarCotacao extends StatefulWidget {
  const GerarCotacao({super.key});

  @override
  _GerarCotacaoState createState() => _GerarCotacaoState();
}

class _GerarCotacaoState extends State<GerarCotacao> {
  String? selectedFilter;
  String? selectedRegion;
  String? selectedClient;
  bool isFiltered = false; // Controle para saber se o filtro foi aplicado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerar Cotação'),
      ),
      body: Column(
        children: [
          // Primeira coluna
          Container(
            color: Colors.grey.shade300,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // modelo geral de organizão dos elementos.
                  children: [
                    // Primeiro elemento: Filtro por
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Filtrar por",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        DropdownButton<String>(
                          hint: Text("Selecione"),
                          value: selectedFilter,
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
                      ],
                    ),
                    // Segundo elemento: Região
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // modelode organizão dos elementos
                      children: [
                        Text("Região",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        DropdownButton<String>(
                          hint: Text("Selecione Região"),
                          value: selectedRegion,
                          items: selectedFilter != null
                              ? [
                                  'Região 1',
                                  'Região 2',
                                  'Região 3'
                                ].map<DropdownMenuItem<String>>((String value) {
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
                      ],
                    ),
                    // Terceiro elemento: Selecionar Cliente
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // modelode organizão dos elementos
                      children: [
                        Text("Selecionar Cliente",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        DropdownButton<String>(
                          hint: Text("Dentro de Todos"),
                          value: selectedClient,
                          items: <String>['Cliente A', 'Cliente B', 'Cliente C']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedClient = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    // Quarto elemento: Botão aplicar filtro
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .end, // modelode organizão dos elementos
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isFiltered = true; // Filtro aplicado
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: Text(
                            "Aplicar Filtro",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
          ),

          // Exibição dos clientes filtrados após pressionar "Aplicar Filtro"
          if (isFiltered)
            Column(
              children: [
                // Título e Botões
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Clientes Filtrados",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Ação para adicionar cliente
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                255, 5, 40, 68), // Cor de fundo do botão
                          ),
                          child: Text(
                            "Adicionar Cliente", // Texto do botão
                            style: TextStyle(
                              color: Colors.white, // Cor do texto
                              fontSize: 10.0, // Tamanho da fonte (opcional)
                              fontWeight:
                                  FontWeight.bold, // Peso da fonte (opcional)
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Pesquisar Cliente",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Planilha de Clientes
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.9, // 90% da largura da tela
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
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Center(
                            child: Text(
                              'Incluir',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'Código',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'Razão Social',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'Nome Fantasia',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'CNPJ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'Qtd. Entrada',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'Total Entrada',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                      rows: List.generate(5, (index) {
                        return DataRow(cells: [
                          DataCell(
                            Center(
                              child: Checkbox(
                                value:
                                    false, // Se quiser controlar o estado do checkbox, substitua por uma variável booleana
                                onChanged: (bool? newValue) {
                                  // Aqui você pode atualizar o valor do checkbox
                                },
                              ),
                            ),
                          ),
                          DataCell(Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Valor Código $index',
                                      style: TextStyle(fontSize: 12))))),
                          DataCell(Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Valor Razão Social $index',
                                      style: TextStyle(fontSize: 12))))),
                          DataCell(Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Valor Nome Fantasia $index',
                                      style: TextStyle(fontSize: 12))))),
                          DataCell(Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Valor CNPJ $index',
                                      style: TextStyle(fontSize: 12))))),
                          DataCell(Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Valor Qtd. Entrada $index',
                                      style: TextStyle(fontSize: 12))))),
                          DataCell(Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Valor Total Entrada $index',
                                      style: TextStyle(fontSize: 12))))),
                        ]);
                      }),
                    ),
                  ),
                )
              ],
            ),

          // quando for criar e reção de button tem que criar outra pagina
          // Botão Gerar Sugestão
          Spacer(),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Coluna ocupa largura total
            children: [
              // Container para ajustar o estilo do botão e a posição
              Container(
                color: Colors.grey.shade300, // Fundo cinza claro
                padding: const EdgeInsets.all(16.0), // Espaçamento interno
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Move o botão para o lado direito
                  children: [
                    // Botão ajustável
                    SizedBox(
                      width: 170, // Largura ajustável do botão
                      height: 30, // Altura ajustável do botão
                      child: ElevatedButton(
                        onPressed: () {
                          // Ação para gerar sugestão
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Cor de fundo azul
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Cantos arredondados
                          ),
                        ),
                        child: Text(
                          "Gerar Sugestão",
                          style: TextStyle(
                              fontSize: 10.0,
                              color:
                                  Colors.white), // Tamanho da fonte ajustável
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
