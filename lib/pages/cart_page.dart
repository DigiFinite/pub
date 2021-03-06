import 'package:dro_health_home_task/bloc/cart/cart_bloc.dart';
import 'package:dro_health_home_task/models/cart_item.dart';
import 'package:dro_health_home_task/utils/dro_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartSuccessfulState) {
                final cartItems = state.cartItems.reversed.toList();

                if (cartItems.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        "Cart is currently empty",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16.0,
                      ),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final CartItem cartItem = cartItems[index];
                        return _buildCartItemWidget(cartItem, index);
                      },
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                      ),
                    ),
                  );
                }
              } else if (state is CartLoadingState) {
                return Expanded(
                  child: Center(
                    child: SpinKitCircle(color: DroColors.purple),
                  ),
                );
              }
              return Expanded(child: Container());
            },
          ),
          Container(
            height: 95,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Total: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartSuccessfulState) {
                          double totalAmount = 0;
                          final cartItems = state.cartItems.reversed;

                          for (CartItem item in cartItems) {
                            totalAmount += item.totalPrice.toDouble();
                          }
                          return Text(
                            "???" + totalAmount.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          );
                        } else if (state is CartLoadingState) {
                          return const Text(
                            "...",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
                _buildCheckoutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCartItemWidget(CartItem cartItem, int index) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                cartItem.product.imageSource.toString(),
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cartItem.product.name.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.product.type.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.0,
                        ),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "${cartItem.product.mass.toString()} mg",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "???" + cartItem.totalPrice.toStringAsFixed(2),
                        style: const TextStyle(
                          color: Color(0xFF363636),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8,
                  ),
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartSuccessfulState) {
                        final cartItems = state.cartItems;
                        return DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            borderRadius: BorderRadius.circular(7),
                            isDense: true,
                            value: cartItem.quantity,
                            underline: const Divider(
                              color: Colors.grey,
                              thickness: 2,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: DroColors.purple,
                            ),
                            items: List.generate(
                              8,
                              (dropdownIndex) {
                                final quantity = dropdownIndex + 1;
                                return DropdownMenuItem<int>(
                                  child: Center(
                                    child: Text(
                                      quantity.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  value: quantity,
                                );
                              },
                            ),
                            onChanged: (value) {
                              setState(() {
                                cartItems[index].quantity = value ?? 1;
                                cartItems[index].totalPrice = value == null
                                    ? 1
                                    : (value * cartItems[index].product.price!);
                              });
                            },
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Image.asset("assets/icons/delete.png"),
                    const SizedBox(width: 8),
                    Text(
                      "Remove",
                      style: TextStyle(
                        color: DroColors.purple,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  BlocProvider.of<CartBloc>(context)
                      .add(RemoveCartItemEvent(cartItem: cartItem));
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return InkWell(
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF7A08FA),
              Color(0xFFAD3BFC),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            "Checkout",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ),
      ),
      // ignore: avoid_print
      onTap: () => print("Clicking checkout"),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/app_bar.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 58.0,
            left: 24,
            right: 24,
            bottom: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      preferredSize: const Size.fromHeight(100),
    );
  }
}
