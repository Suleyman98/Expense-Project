import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  Function nt;
  Function del;
  NewTransaction({super.key, required this.nt, required this.del});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  DateTime? selectedDate;
  final amountController = TextEditingController();
  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'No Date Chosen'
                        : 'Picked Date: ' +
                            DateFormat.yMd().format(selectedDate!),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: presentDatePicker, child: Text('Choose Date'))
              ]),
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.nt(
                        selectedDate,
                        titleController.text,
                        double.parse(
                          amountController.text,
                        ));
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.purple),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
