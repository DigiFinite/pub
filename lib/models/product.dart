import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  Product({
    this.id,
    this.name,
    this.type,
    this.mass,
    this.price,
    this.imageSource,
    this.manufacturer,
    this.manufacturerLogo,
  });

  final int? id;
  final String? name;
  final String? type;
  final String? mass;
  final double? price;
  final String? imageSource;
  final String? manufacturer;
  final String? manufacturerLogo;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'mass': mass,
      'price': price,
      'imageSource': imageSource,
      'manufacturer': manufacturer,
      'manufacturerLogo': manufacturerLogo,
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
      manufacturer: map['manufacturer'],
      manufacturerLogo: map['manufacturerLogo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        mass,
        price,
        imageSource,
        manufacturer,
        manufacturerLogo
      ];
}
