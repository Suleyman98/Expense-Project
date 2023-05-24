import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as date;
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  List<Transaction> transactions;
  TransactionList({super.key, required this.transactions});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...widget.transactions
            .map((e) => Card(
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                elevation: 6,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(child: Text('\$${e.amount}')),
                    ),
                  ),
                  title: Text(
                    e.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(DateFormat.yMMMd().format(e.date)),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.transactions.remove(e);
                        });
                      },
                      icon: Icon(Icons.delete)),
                )))
            .toList(),
      ],
    );
  }
}
