import 'package:flutter/material.dart';

class DataSelector extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime?) onDateSelected;

  DataSelector({required this.selectedDate, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Selecione a Data:', style: TextStyle(fontSize: 16)),
        Row(
          children: [
            Text(selectedDate != null
                ? selectedDate!.toLocal().toString().split(' ')[0]
                : 'Nenhuma data selecionada'),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                onDateSelected(picked);
              },
            ),
          ],
        ),
      ],
    );
  }
}
