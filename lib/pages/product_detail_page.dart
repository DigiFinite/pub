import 'package:dro_health_home_task/models/category.dart';
import 'package:dro_health_home_task/widgets/category_container.dart';
import 'package:dro_health_home_task/widgets/dro_counter.dart';
import 'package:dro_health_home_task/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:dro_health_home_task/models/product.dart';
import 'package:dro_health_home_task/utils/dro_colors.dart';
import 'package:dro_health_home_task/widgets/dro_favorite_button.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Product _product;

  @override
  void initState() {
    super.initState();
    _product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        _product.imageSource.toString(),
                        height: 170,
                        width: 170,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _product.name.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _product.type.toString(),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
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
                            "${_product.mass.toString()} mg",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Image.asset(
                            _product.imageSource.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "SOLD BY",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "Emzor Paracetamol",
                              style: TextStyle(
                                color: DroColors.navyBlue,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const DroFavoriteButton()
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        DroCounterWidget(
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Pack(s)",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '',
                          ),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(-4.0, -12.0),
                              child: SvgPicture.asset(
                                "assets/icons/naira.svg",
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: "${_product.price?.toInt()}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(0.0, 0.0),
                              child: const Text(
                                '.00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "PRODUCT DETAILS",
                  style: TextStyle(
                    color: DroColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  // mainAxi
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductDetailItem(
                          'assets/icons/capsules.png',
                          "PACK SIZE",
                          '8 x 12 tablets (96)',
                        ),
                        const SizedBox(height: 20),
                        _buildProductDetailItem(
                          'assets/icons/capsule.png',
                          "CONSTITUENTS",
                          'Paracetamol',
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductDetailItem(
                          'assets/icons/barcode.png',
                          "PACK SIZE",
                          'PRO23648856',
                        ),
                        const SizedBox(height: 20),
                        _buildProductDetailItem(
                          'assets/icons/dispense_cap.png',
                          "DISPENSED IN",
                          'Packs',
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Similar Products",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Container(
                  height: 280,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: _buildSimilarProductsList(),
                ),
              ],
            ),
          ),
          Container(
            height: 95,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF7A08FA),
                      Color(0xFFAD3BFC),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "Add to cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => {},
            ),
          )
        ],
      ),
    );
  }

  ListView _buildSimilarProductsList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final drug = products[index];
        return ProductCard(product: drug);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 16,
      ),
      itemCount: products.length,
    );
  }

  Row _buildProductDetailItem(String imageSrc, String title, String value) {
    return Row(
      children: [
        Image.asset(imageSrc),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: DroColors.grey,
                fontSize: 10,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                  color: DroColors.navyBlue, fontWeight: FontWeight.w700),
            ),
          ],
        )
      ],
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
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pharmacy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Stack(
                          children: [
                            const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            Positioned(
                              top: 0,
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
                        )
                      ],
                    ),
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
