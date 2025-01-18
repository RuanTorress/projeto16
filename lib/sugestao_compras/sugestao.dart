import 'package:flutter/material.dart';
import './rotas_sugestão/gerar_cotacao.dart';

import './rotas_sugestão/historico.dart';
import './rotas_sugestão/status_service.dart'; // Importando a classe StatusService

class SugestaoDeComprasScreen extends StatefulWidget {
  const SugestaoDeComprasScreen({super.key});

  @override
  _SugestaoDeComprasScreenState createState() =>
      _SugestaoDeComprasScreenState();
}

class _SugestaoDeComprasScreenState extends State<SugestaoDeComprasScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Sugestão de Compras",
              style:
                  TextStyle(color: Colors.black), // Personalize a cor do título
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), // Altura do AppBar
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: "Resumo de Hoje"),
                Tab(text: "Histórico"),
                Tab(text: "Gerar Cotação"),
              ],
              indicatorColor: Colors.blue, // Cor do indicador das tabs
              labelColor: Colors.blue, // Cor do texto das tabs selecionadas
              unselectedLabelColor:
                  Colors.black, // Cor do texto das tabs não selecionadas
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildResumoDeHoje(),
          _buildHistorico(),
          _buildGerarCotacao(), // Chama o método correto para a aba "Gerar Cotação"
        ],
      ),
    );
  }

  // Método para construir a tela de "Resumo de Hoje"
  Widget _buildResumoDeHoje() {
    // Usando a lógica da StatusService para pegar os dados
    List<String> statusList = StatusService.getStatus();
    String cotacaoHoje = StatusService.getCotacaoHoje();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resumo de Cotação de Hoje',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            cotacaoHoje,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),

          // Exibe os status de cotação usando a lista retornada pela StatusService
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: statusList.map((status) {
              return _buildResumoItem(
                  status, Colors.yellow); // Exibe cada status na tela
            }).toList(),
          ),

          const Divider(
            // Linha de divisão
            color: Colors.grey, // Cor da linha
            thickness: 1, // Espessura da linha
            indent: 0, // Espaçamento antes da linha
            endIndent: 0, // Espaçamento depois da linha
          ),

          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cotação",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text("Processo"),
              ),
              Text(
                "Situação",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                hint: Text("Todos Pendentes"),
                items: <String>[
                  'Todos',
                  'Pendente de Envio',
                  'Finalizados',
                  'Em Análise Associado',
                  'Em Análise Operador',
                  'Pendente Plataforma',
                  'Gerado Sugestão'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
              SizedBox(
                width: 120,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Pesquisa Cotação",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildSpreadsheetTable(),
        ],
      ),
    );
  }

  // Widget para a tabela estilo Excel
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

  // Widget para o item de resumo
  Widget _buildResumoItem(String title, Color color) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4), // Borda arredondada
        border: Border.all(
            color: Colors.black.withOpacity(0.2),
            width: 0.5), // Borda com cor e espessura
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildHistorico() {
    return Historico();
  }

  // Alterado o nome do método para "buildGerarCotacao"
  Widget _buildGerarCotacao() {
    return GerarCotacao(); // Certifique-se de que GerarCotacao é um Widget válido
  }
}
