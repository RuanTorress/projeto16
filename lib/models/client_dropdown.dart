import 'package:flutter/material.dart';

class ClientDropdown extends StatelessWidget {
  final String? selectedClient;
  final Function(String?) onClientSelected;

  final List<String> _clients = [
    '001', // Código do Cliente A
    '002', // Código do Cliente B
    '004',
    '005',
    '006',
    '007',
    '008',
    '009',
    '010',
    // Código do Cliente C
    'Selecionar Todos'
  ];

  ClientDropdown(
      {required this.selectedClient, required this.onClientSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Selecione o Código do Cliente:', style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: selectedClient,
          hint: Text('Escolha um código'),
          onChanged: (value) {
            onClientSelected(value);
          },
          items: _clients.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
