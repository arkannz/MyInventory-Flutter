import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/item.dart';
import 'add_edit_item_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final data = await DatabaseHelper.instance.getItems();
    setState(() {
      items = data;
    });
  }

  void _deleteItem(int id) async {
    await DatabaseHelper.instance.deleteItem(id);
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyInventory')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Stock: ${item.stock}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteItem(item.id!),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddEditItemScreen(item: item),
              ),
            ).then((_) => _loadItems()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AddEditItemScreen()),
        ).then((_) => _loadItems()),
      ),
    );
  }
}