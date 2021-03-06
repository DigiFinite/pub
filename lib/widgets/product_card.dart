import 'package:dro_health_home_task/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late Product _product;
  @override
  void initState() {
    super.initState();
    _product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 260,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(196, 196, 196, 1.1),
            offset: Offset(0, 6),
            blurRadius: 6,
            spreadRadius: 3,
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/product_detail', arguments: _product);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              _product.imageSource.toString(),
              height: 155,
              width: 200,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _product.name.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            _product.type.toString(),
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
                            "${_product.mass.toString()} mg",
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
                           "???"+ _product.price!.toStringAsFixed(2),
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
