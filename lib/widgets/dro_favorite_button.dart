import 'package:dro_health_home_task/utils/dro_colors.dart';
import 'package:flutter/material.dart';

class DroFavoriteButton extends StatelessWidget {
  const DroFavoriteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(159, 93, 226, 0.1),
      ),
      child: Icon(
        Icons.favorite_outline,
        color: DroColors.purple,
      ),
    );
  }
}