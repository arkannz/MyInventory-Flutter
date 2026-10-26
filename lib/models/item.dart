class Item {
  final int? id;
  final String name;
  final int stock;

  Item({this.id, required this.name, required this.stock});

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    id: json['id'],
    name: json['name'],
    stock: json['stock'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'stock': stock,
  };
}