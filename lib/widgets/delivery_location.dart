import 'package:flutter/material.dart';

class DeliveryLocationWidget extends StatelessWidget {
  const DeliveryLocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16,
      ),
      child: Row(
        children: const [
          Icon(
            Icons.location_on_outlined,
          ),
          Text.rich(
            TextSpan(
              text: "Delivery in ",
              children: [
                TextSpan(
                  text: "Lagos, NG",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
