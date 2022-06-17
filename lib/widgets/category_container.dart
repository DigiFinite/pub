import 'package:flutter/material.dart';

import 'package:dro_health_home_task/models/category.dart';

class CategoryContainer extends StatelessWidget {
  final Category category;
  final double? height;
  const CategoryContainer({
    Key? key,
    required this.category,
     this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      width: 125,
      height: height ?? 120,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          opacity: 0.3,
          fit: BoxFit.cover,
          image: AssetImage(
            category.imageSource.toString(),
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(196, 196, 196, .1),
            offset: Offset(-1, 6),
            blurRadius: 3,
            spreadRadius: 3,
          )
        ],
      ),
      child: Text(
        category.title.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
