import 'package:dro_health_home_task/models/product.dart';

class CartItem {
  Product product;
  int quantity;
  double totalPrice;
  CartItem({
    required this.product,
    required this.quantity,
  }) : totalPrice = quantity * product.price!;
}
