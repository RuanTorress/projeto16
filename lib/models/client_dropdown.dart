import 'package:flutter/material.dart';

class ClientDropdown extends StatelessWidget {
  final String? selectedClient;
  final Function(String?) onClientSelected;

  final List<String> _clients = [
<<<<<<< HEAD
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
=======
    'Cliente A',
    'Cliente B',
    'Cliente C',
>>>>>>> c133d806e1e8f2e9a3a00d2e0ea54b68018697d8
    'Selecionar Todos'
  ];

  ClientDropdown(
      {required this.selectedClient, required this.onClientSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
<<<<<<< HEAD
        Text('Selecione o Código do Cliente:', style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: selectedClient,
          hint: Text('Escolha um código'),
=======
        Text('Selecione o Cliente:', style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: selectedClient,
          hint: Text('Escolha um cliente'),
>>>>>>> c133d806e1e8f2e9a3a00d2e0ea54b68018697d8
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
