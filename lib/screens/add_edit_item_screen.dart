import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/item.dart';

class AddEditItemScreen extends StatefulWidget {
  final Item? item;

  AddEditItemScreen({this.item});

  @override
  _AddEditItemScreenState createState() => _AddEditItemScreenState();
}

class _AddEditItemScreenState extends State<AddEditItemScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  int stock = 0;

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      name = widget.item!.name;
      stock = widget.item!.stock;
    }
  }

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final item = Item(id: widget.item?.id, name: name, stock: stock);
      if (widget.item == null) {
        await DatabaseHelper.instance.insertItem(item);
      } else {
        await DatabaseHelper.instance.updateItem(item);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item == null ? 'Add Item' : 'Edit Item')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: 'Item Name'),
                onSaved: (val) => name = val!,
                validator: (val) => val!.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                initialValue: stock.toString(),
                decoration: InputDecoration(labelText: 'Stock'),
                keyboardType: TextInputType.number,
                onSaved: (val) => stock = int.parse(val!),
                validator: (val) => val!.isEmpty ? 'Enter stock' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveItem,
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}