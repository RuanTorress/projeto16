import 'package:flutter/material.dart';
import './data_selector.dart';
import './client_dropdown.dart';
import './imported_data_table.dart';
import './ImportedData.dart';
import '../navegacao_lateral/nav_pagina.dart';

void main() {
  runApp(MaterialApp(home: MyForm())); // Removido o "const"
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Linha no topo da Seção Superior (antes de qualquer conteúdo)
            Divider(),

            // Seção Superior com os filtros
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DataSelector(
                  selectedDate: _selectedDate,
                  onDateSelected: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),
                ClientDropdown(
                  selectedClient: _selectedClient,
                  onClientSelected: (client) {
                    setState(() {
                      _selectedClient = client;
                    });
                  },
                ),
                Row(
                  children: [
                    Text('Somente Associado:'),
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
                ElevatedButton(
                  onPressed: _importData,
                  child: Text('Importar Dados'),
                ),
              ],
            ),

            // Linha divisória entre Seção Superior e Seção Inferior
            Divider(),

            // Seção Inferior com Pesquisa e Tabela
            if (_isDataImported)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Informações Importadas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Pesquisar Cliente',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                        ),
                        onChanged: (text) {
                          setState(() {
                            _searchText = text;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

            // Exibição da tabela de dados importados (Tabela ocupa toda a largura)
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
    );
  }
}
