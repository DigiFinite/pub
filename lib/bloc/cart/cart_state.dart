part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitialState extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartSuccessfulState extends CartState {
  final List<CartItem> cartItems;
  const CartSuccessfulState({
    required this.cartItems,
  });
  @override
  List<Object> get props => [cartItems];
}

class CartFailedState extends CartState {
  final dynamic data;
  const CartFailedState({
    required this.data,
  });
  @override
  List<Object> get props => [data];
}

class CartItemAddedStateSuccessfulState extends CartState {
  final CartItem cartItem;
  const CartItemAddedStateSuccessfulState({
    required this.cartItem,
  });
  @override
  List<Object> get props => [cartItem];
}

class CartItemAddedFailedState extends CartState {
  final List<CartItem> cartItems;
  const CartItemAddedFailedState({
    required this.cartItems,
  });
  @override
  List<Object> get props => [cartItems];
}
