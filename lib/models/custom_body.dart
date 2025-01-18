import 'package:flutter/material.dart';
import './data_selector.dart';
import './client_dropdown.dart';
import './imported_data_table.dart';
import './ImportedData.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  DateTimeRange?
      _selectedDateRange; // Alterado para suportar intervalo de datas
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
      // Filtro para data
      final matchesDate = _selectedDateRange == null ||
          (data['Data'] != null &&
              DateTime.parse(data['Data']!).isAfter(_selectedDateRange!.start
                  .subtract(Duration(days: 1))) && // Considera a data de início
              DateTime.parse(data['Data']!).isBefore(_selectedDateRange!.end
                  .add(Duration(days: 1)))); // Considera a data de fim

      // Filtro para cliente
      final matchesClient = _selectedClient == null ||
          _selectedClient == 'Selecionar Todos' ||
          data['Código']?.toLowerCase() == _selectedClient?.toLowerCase();

      // Filtro para associado
      final matchesAssociate = !_isAssociatedOnly || data['Associado'] == 'Sim';

      // Filtro para pesquisa
      final matchesSearch = _searchText.isEmpty ||
          (data['Razão Social']
                  ?.toLowerCase()
                  .contains(_searchText.toLowerCase()) ??
              false) ||
          (data['Nome Fantasia']
                  ?.toLowerCase()
                  .contains(_searchText.toLowerCase()) ??
              false);

      // Retorna se todos os filtros foram satisfeitos
      return matchesDate && matchesClient && matchesAssociate && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulário de Importação',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white, // Cor de fundo da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color.fromARGB(255, 239, 238, 238),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: DataSelector(
                      selectedDateRange: _selectedDateRange,
                      onDateRangeSelected: (range) {
                        setState(() {
                          _selectedDateRange = range;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
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
                  const SizedBox(width: 1),
                  Row(
                    children: [
                      Switch(
                        value: _isAssociatedOnly,
                        onChanged: (value) {
                          setState(() {
                            _isAssociatedOnly = value;
                          });
                        },
                      ),
                      const Text('Somente Associado:'),
                    ],
                  ),
                  const SizedBox(width: 466), // espaço do associado
                  ElevatedButton(
                    onPressed: _importData,
                    child: const Text('Importar Dados'),
                  ),
                  const SizedBox(width: 96), // espaço do button
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (_isDataImported)
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Row(
                  children: [
                    const Text(
                      'Informações Importadas',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    const Spacer(), // Espaço flexível para empurrar os elementos
                    SizedBox(
                      width: 500, // Definindo uma largura fixa para o campo
                      child: TextField(
                        decoration: const InputDecoration(
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
                    const SizedBox(
                        width:
                            225), // espaça mento do campo do pesquisa cliente
                  ],
                ),
              ),
            const SizedBox(height: 10), // Espaçamento entre o Row e o Divider
            const Divider(
              color: Colors.grey, // Cor da linha
              thickness: 1, // Espessura da linha
            ),

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
