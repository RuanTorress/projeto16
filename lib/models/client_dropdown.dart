import 'package:flutter/material.dart';

class ClientDropdown extends StatelessWidget {
  final String? selectedClient;
  final Function(String?) onClientSelected;

  final List<String> _clients = [
    'Cliente A',
    'Cliente B',
    'Cliente C',
    'Selecionar Todos'
  ];

  ClientDropdown(
      {required this.selectedClient, required this.onClientSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Selecione o Cliente:', style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: selectedClient,
          hint: Text('Escolha um cliente'),
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
