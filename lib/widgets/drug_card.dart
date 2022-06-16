import 'package:flutter/material.dart';

import 'package:dro_health_home_task/models/drug.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DrugCard extends StatefulWidget {
  final Drug drug;
  const DrugCard({
    Key? key,
    required this.drug,
  }) : super(key: key);

  @override
  _DrugCardState createState() => _DrugCardState();
}

class _DrugCardState extends State<DrugCard> {
  late Drug _drug;
  @override
  void initState() {
    super.initState();
    _drug = widget.drug;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Image.asset(
            _drug.imageSource.toString(),
            height: 165,
            width: double.infinity,
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
                      _drug.name.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          _drug.type.toString(),
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
                          "${_drug.mass.toString()} mg",
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
                          ).format(_drug.price),
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
    );
  }
}
