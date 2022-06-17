import 'dart:convert';

class Product {
  Product({
    this.id,
    this.name,
    this.type,
    this.mass,
    this.price,
    this.imageSource,
  });

  final int? id;
  final String? name;
  final String? type;
  final String? mass;
  final double? price;
  final String? imageSource;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'mass': mass,
      'price': price,
      'imageSource': imageSource,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt(),
      name: map['name'],
      type: map['type'],
      mass: map['mass'],
      price: map['price']?.toDouble(),
      imageSource: map['imageSource'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}

