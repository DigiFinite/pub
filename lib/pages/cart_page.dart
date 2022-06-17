import 'package:dro_health_home_task/models/cart_item.dart';
import 'package:dro_health_home_task/models/product.dart';
import 'package:dro_health_home_task/utils/dro_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
      product: Product(
        id: 1,
        name: "Paracetamol",
        type: "Tablet",
        mass: "500",
        price: 350,
        imageSource: "assets/images/emzor_paracetamol.jpeg",
      ),
      quantity: 1,
    ),
    CartItem(
      product: Product(
        id: 2,
        name: "Doliprane",
        type: "Capsule",
        mass: "1000",
        price: 350,
        imageSource: "assets/images/doliprane_paracetamol.jpeg",
      ),
      quantity: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    for (CartItem item in cartItems) {
      totalAmount += item.totalPrice.toDouble();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
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
                    SvgPicture.asset("assets/icons/naira.svg"),
                     Text(
                      "$totalAmount",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
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
                      SvgPicture.asset(
                        "assets/icons/naira.svg",
                      ),
                      Text(
                        NumberFormat.simpleCurrency(
                          decimalDigits: 2,
                          name: "",
                        ).format(cartItem.totalPrice),
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      borderRadius: BorderRadius.circular(7),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: DroColors.purple,
                      ),
                      isDense: true,
                      value: cartItem.quantity,
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
                        // ignore: avoid_print
                        setState(() {
                          cartItems[index].quantity = value ?? 1;
                          cartItems[index].totalPrice = value == null
                              ? 1
                              : (value * cartItems[index].product.price!);
                        });
                        print("Quantity is: ${cartItems[index].quantity}");
                      },
                    ),
                  ),
                ),
              ),
              Row(
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
