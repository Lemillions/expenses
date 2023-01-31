import 'models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: "t1",
      title: "Novo teclado",
      value: 280.00,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    List<Card> widgetTransaction = _transactions.map((transaction) {
      return Card(
        child: Text(transaction.title),
      );
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.blue,
            child: Text('Gráfico'),
            elevation: 5,
          ),
        ),
        Column(
          children: [...widgetTransaction],
        )
      ]),
    );
  }
}
