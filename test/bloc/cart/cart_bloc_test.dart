import 'package:bloc_test/bloc_test.dart';
import 'package:dro_health_home_task/bloc/cart/cart_bloc.dart';
import 'package:dro_health_home_task/models/cart_item.dart';
import 'package:dro_health_home_task/models/product.dart';
import 'package:dro_health_home_task/repository/dro_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test for categories bloc", () {
    late final Product product;

    product = Product(
      id: 4,
      name: "Ibuprofen",
      type: "Tablet",
      mass: "200",
      price: 700,
      imageSource: "assets/images/ibuprofen.jpg",
      manufacturer: "Numark",
      manufacturerLogo: "assets/images/numark.png",
    );

    test("Test if the initial state is ProductInitialState", () {
      expect(CartBloc().state, CartInitialState());
    });

    test("Check if the cart is initially empty", () async {
      final cartItems = await DroRepository.fetchAllCartItems();
      expect(cartItems?.length, 0);
    });

    blocTest("Emit CartLoadingState and CartSuccessfullState with empty list",
        build: () => CartBloc(),
        act: (CartBloc bloc) => bloc.add(FetchAllCartItemsEvent()),
        expect: () => [
              CartLoadingState(),
              const CartSuccessfulState(cartItems: []),
            ]);

    blocTest(
      "Check to see if a new cartItem can be added to the cart",
      build: () => CartBloc(),
      act: (CartBloc bloc) {
        final CartItem item = CartItem(
          product: product,
          quantity: 2,
          totalPrice: 800,
        );
        bloc.add(AddItemToCartEvent(cartItem: item));
      },
      expect: () => [
        CartItemAddedStateSuccessfulState(
          cartItem: CartItem(
            product: product,
            quantity: 2,
            totalPrice: 800,
          ),
        ),
        CartLoadingState()
      ],
    );

    blocTest(
      "Check to see if item can be removed from the cart",
      build: () => CartBloc(),
      act: (CartBloc bloc) {
        final CartItem item = CartItem(
          product: product,
          quantity: 2,
          totalPrice: 800,
        );

        bloc.add(RemoveCartItemEvent(cartItem: item));
      },
      expect: () => [
        CartLoadingState(),
        const CartSuccessfulState(cartItems: []),
        CartLoadingState()
      ],
    );
  });
}
