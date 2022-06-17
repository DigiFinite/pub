import 'package:bloc/bloc.dart';
import 'package:dro_health_home_task/models/cart_item.dart';
import 'package:dro_health_home_task/models/cart_item_response.dart';
import 'package:dro_health_home_task/repository/dro_repository.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      if (event is FetchAllCartItemsEvent) {
        emit(CartLoadingState());
        final List<CartItem>? result = await DroRepository.fetchAllCartItems();

        // ignore: avoid_print
        print("Calling to fetch products");

        if (result == null) {
          emit(
            const CartFailedState(data: "Failed to load Cart"),
          );
        } else {
          emit(CartSuccessfulState(cartItems: result));
        }
      } else if (event is AddItemToCartEvent) {
        final CartItem cartItem = event.cartItem;

        final CartItemResponse result =
            await DroRepository.addItemToCart(cartItem);

        if (result.status == "error") {
          emit(CartItemAddedFailedState(cartItems: result.cartItems));
          add(FetchAllCartItemsEvent());
        } else {
          emit(CartItemAddedStateSuccessfulState(
            cartItem: result.cartItems.last,
          ));
          add(FetchAllCartItemsEvent());
        }
      } else if (event is RemoveCartItemEvent) {
        emit(CartLoadingState());
        final CartItem cartItem = event.cartItem;
        final List<CartItem>? result =
            await DroRepository.removeItemFromCart(cartItem);

        if (result == null) {
          emit(const CartFailedState(data: "Error removing item"));
        } else {
          add(FetchAllCartItemsEvent());
          // emit(CartSuccessfulState(cartItems: result));
        }
      }
    });
  }
}
