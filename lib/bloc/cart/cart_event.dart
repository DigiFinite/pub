part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class FetchAllCartItemsEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddItemToCartEvent extends CartEvent {
  final CartItem cartItem;
  const AddItemToCartEvent({
    required this.cartItem,
  });
  @override
  List<Object> get props => [cartItem];
}


class RemoveCartItemEvent extends CartEvent {
  final CartItem cartItem;
  const RemoveCartItemEvent({
    required this.cartItem,
  });
  @override
  List<Object> get props => [cartItem];
}

