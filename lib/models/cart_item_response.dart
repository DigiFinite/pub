import 'package:dro_health_home_task/models/cart_item.dart';

class CartItemResponse {
  CartItemResponse({
    required this.status,
    required this.cartItems,
  });
  late final String status;
  late final List<CartItem> cartItems;

  CartItemResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    cartItems =
        List.from(json['cartItems']).map((e) => CartItem.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['cartItems'] = cartItems.map((e) => e.toJson()).toList();
    return _data;
  }
}
