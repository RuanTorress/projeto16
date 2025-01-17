import 'package:flutter/material.dart';
import './data_selector.dart';
import './client_dropdown.dart';
import './imported_data_table.dart';
import './ImportedData.dart';

void main() {
  runApp(MaterialApp(home: MyForm()));
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  DateTime? _selectedDate;
  String? _selectedClient;
  bool _isAssociatedOnly = false;
  List<Map<String, String>> _importedData = [];
  bool _isDataImported = false;
  String _searchText = '';

  void _importData() {
    setState(() {
      _importedData = ImportedData.getAllData();
      _isDataImported = true;
    });
  }

  List<Map<String, String>> _filterData() {
    return _importedData.where((data) {
      final matchesDate =
          _selectedDate == null || true; // Campo 'Data' não existe
      final matchesClient = _selectedClient == null ||
          _selectedClient == 'Selecionar Todos' ||
          data['Nome Fantasia']?.toLowerCase() ==
              _selectedClient?.toLowerCase();
      final matchesAssociate = !_isAssociatedOnly || data['Associado'] == 'Sim';
      final matchesSearch = _searchText.isEmpty ||
          data['Razão Social']
                  ?.toLowerCase()
                  .contains(_searchText.toLowerCase()) ==
              true ||
          data['Nome Fantasia']
                  ?.toLowerCase()
                  .contains(_searchText.toLowerCase()) ==
              true;
      return matchesDate && matchesClient && matchesAssociate && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário de Importação')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Seção superior com filtros (todos os elementos na mesma linha)
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Seletor de data
                  Expanded(
                    child: DataSelector(
                      selectedDate: _selectedDate,
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),

                  // Dropdown de cliente
                  Expanded(
                    child: ClientDropdown(
                      selectedClient: _selectedClient,
                      onClientSelected: (client) {
                        setState(() {
                          _selectedClient = client;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),

                  // Filtro para associados e Botão para importar dados lado a lado
                  Row(
                    children: [
                      // Filtro para associados
                      Row(
                        children: [
                          Text('Associado:'),
                          Switch(
                            value: _isAssociatedOnly,
                            onChanged: (value) {
                              setState(() {
                                _isAssociatedOnly = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(width: 10),

                      // Botão para importar dados
                      ElevatedButton(
                        onPressed: _importData,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        child: Text('Importar Dados'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Seção inferior com pesquisa e tabela
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Campo de pesquisa do cliente e Título "Informações Importadas"
                  if (_isDataImported)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Título Informações Importadas
                        Text(
                          'Informações Importadas',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Campo de pesquisa do cliente
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: SizedBox(
                            width:
                                200, // Largura ajustável para o campo de pesquisa
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Pesquisar Cliente',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                suffixIcon: Icon(Icons.search),
                              ),
                              onChanged: (text) {
                                setState(() {
                                  _searchText = text;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                  SizedBox(height: 20),

                  // Exibição da tabela de dados importados (rolável)
                  if (_isDataImported)
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ImportedDataTable(
                          importedData: _filterData(),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
