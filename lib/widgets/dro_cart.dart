import 'package:dro_health_home_task/bloc/cart/cart_bloc.dart';
import 'package:dro_health_home_task/utils/dro_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DroCart extends StatelessWidget {
  const DroCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartSuccessfulState) {
          final cartItems = state.cartItems;
          if (cartItems.isEmpty) {
            return const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            );
          } else {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
                Positioned(
                  top: -5,
                  right: 2,
                  child: Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                      color: DroColors.yellow,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            );
          }
        }
        return const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        );
      },
    );
  }
}
