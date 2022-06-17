import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:dro_health_home_task/models/product.dart';

// ignore: must_be_immutable
class CartItem extends Equatable {
  Product product;
  int quantity;
  double totalPrice;
   CartItem({
    required this.product,
    required this.quantity,
    totalPrice,
  }) : totalPrice = quantity * product.price!;

  @override

  List<Object?> get props => [
        product,
        quantity,
        totalPrice,
      ];

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
      'totalPrice': totalPrice,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      product: Product.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) => CartItem.fromMap(json.decode(source));
}
