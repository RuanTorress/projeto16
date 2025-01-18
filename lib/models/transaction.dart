<<<<<<< HEAD

=======
import 'package:flutter/material.dart';

class Transaction {
  final String description; // Texto de descrição
  String amount; // Valor da transação

  Transaction({
    required this.description,
    required this.amount,
  });

  // Método para construir a Row com o Dropdown e outros elementos
  /* Widget buildRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        color: Colors.amberAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Alinha os itens
          children: [
            // Descrição da transação (isso permanece como um texto normal)

            Text(
              description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // Campo de valor
            SizedBox(
              width: 250,
              child: TextField(
                controller: TextEditingController(text: amount),
                decoration: InputDecoration(
                  hintText: 'ruan',
                  border: OutlineInputBorder(),
                ),
                onChanged: (newAmount) {
                  amount = newAmount;
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),

            // Substituindo o texto de cliente por um Dropdown para selecionar o cliente
          ],
        ),
      ),
    );
  }*/
}
>>>>>>> c133d806e1e8f2e9a3a00d2e0ea54b68018697d8
