import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double value) onSubmit;
  TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  void submitForm() {
    final title = titleController.text.toString();
    final value = double.tryParse(valueController.text) ?? 0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "Título"),
              controller: titleController,
            ),
            TextField(
                decoration: const InputDecoration(labelText: "Valor R\$"),
                onSubmitted: (_) => submitForm(),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                controller: valueController),
            TextButton(
              onPressed: submitForm,
              style: TextButton.styleFrom(foregroundColor: Colors.purple),
              child: const Text("Nova transação"),
            )
          ],
        ),
      ),
    );
  }
}
