import 'package:flutter/material.dart';

class DataSelector extends StatelessWidget {
<<<<<<< HEAD
  // Variáveis de entrada que representam o intervalo de datas selecionado
  // e a função que será chamada quando uma nova seleção for feita.
  final DateTimeRange? selectedDateRange;
  final Function(DateTimeRange?) onDateRangeSelected;

  // Construtor da classe DataSelector, onde as variáveis são inicializadas
  const DataSelector({
    required this.selectedDateRange, // A data selecionada pelo usuário
    required this.onDateRangeSelected, // Função para atualizar a data selecionada
    Key? key,
  }) : super(key: key);
=======
  final DateTime? selectedDate;
  final Function(DateTime?) onDateSelected;

  DataSelector({required this.selectedDate, required this.onDateSelected});
>>>>>>> c133d806e1e8f2e9a3a00d2e0ea54b68018697d8

  @override
  Widget build(BuildContext context) {
    return Column(
<<<<<<< HEAD
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alinha os filhos à esquerda
      children: [
        const Text(
          'Selecione o Período:', // Título indicando que o usuário deve selecionar um período
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold), // Estilo do título
        ),
        const SizedBox(
            height:
                3), // Espaçamento entre o título e o widget de seleção de data
        GestureDetector(
          onTap: () async {
            // Quando o usuário clica, abre o seletor de intervalo de datas
            final DateTimeRange? picked = await showDateRangePicker(
              context: context,
              initialDateRange:
                  selectedDateRange ?? // Valor inicial para o intervalo
                      DateTimeRange(
                        start: DateTime.now().subtract(
                            const Duration(days: 7)), // Data inicial padrão
                        end: DateTime.now(), // Data final padrão (hoje)
                      ),
              firstDate:
                  DateTime(2000), // A primeira data que pode ser selecionada
              lastDate:
                  DateTime(2101), // A última data que pode ser selecionada
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    // Personaliza o tema do seletor de data
                    colorScheme: ColorScheme.light(
                      primary: Colors.blue, // Cor do cabeçalho
                      onPrimary: Colors.white, // Cor do texto no cabeçalho
                      onSurface: Colors.black, // Cor do texto padrão
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue, // Cor dos botões de ação
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );
            // Chama a função para atualizar o intervalo de datas selecionado
            onDateRangeSelected(picked);
          },
          child: Container(
            width: 350, // Largura fixa
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white, // Cor de fundo do container
              borderRadius: BorderRadius.circular(10), // Bordas arredondadas
              border: Border.all(color: Colors.grey[300]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1), // Sombra leve
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 2), // Direção da sombra
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Alinha os itens no eixo horizontal
              children: [
                Row(
                  mainAxisSize: MainAxisSize
                      .min, // O tamanho mínimo necessário para o conteúdo
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 18, color: Colors.grey), // Ícone do calendário
                    const SizedBox(
                        width: 6), // Espaçamento entre o ícone e o texto
                    Text(
                      selectedDateRange != null
                          ? selectedDateRange!.start
                              .toLocal()
                              .toString()
                              .substring(0, 10) // Exibe a data de início
                          : "Início", // Se não houver seleção, exibe "Início"
                      style: const TextStyle(fontSize: 14), // Estilo do texto
                    ),
                  ],
                ),
                const Text(' | ',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 14)), // Separador
                Row(
                  mainAxisSize: MainAxisSize
                      .min, // O tamanho mínimo necessário para o conteúdo
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 18, color: Colors.grey), // Ícone do calendário
                    const SizedBox(
                        width: 6), // Espaçamento entre o ícone e o texto
                    Text(
                      selectedDateRange != null
                          ? selectedDateRange!.end
                              .toLocal()
                              .toString()
                              .substring(0, 10) // Exibe a data de fim
                          : "Fim", // Se não houver seleção, exibe "Fim"
                      style: const TextStyle(fontSize: 14), // Estilo do texto
                    ),
                  ],
                ),
              ],
            ),
          ),
=======
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
>>>>>>> c133d806e1e8f2e9a3a00d2e0ea54b68018697d8
        ),
      ],
    );
  }
<<<<<<< HEAD

  // Método para formatar a data de forma legível
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
=======
>>>>>>> c133d806e1e8f2e9a3a00d2e0ea54b68018697d8
}
