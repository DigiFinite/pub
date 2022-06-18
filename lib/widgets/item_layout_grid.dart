import 'package:dro_health_home_task/models/product.dart';
import 'package:dro_health_home_task/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ItemCardLayoutGrid extends StatelessWidget {
  const ItemCardLayoutGrid({
    Key? key,
    required this.crossAxisCount,
    required this.items,
  })  
  // we only plan to use this with 1 or 2 columns
  : assert(crossAxisCount == 1 || crossAxisCount == 2),
        // assume we pass an list of 4 items for simplicity
        // assert(items.length == 4),
        super(key: key);
  final int crossAxisCount;
  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      // set some flexible track sizes based on the crossAxisCount
      columnSizes: crossAxisCount == 2 ? [1.fr, 1.fr] : [1.fr],
      // set all the row sizes to auto (self-sizing height)
      rowSizes: crossAxisCount == 2
          ? const [auto, auto]
          : const [auto, auto, auto, auto],
      rowGap: 30, // equivalent to mainAxisSpacing
      columnGap: 10, // equivalent to crossAxisSpacing

      children: List.generate(
        4,
        (index) {
          return ProductCard(product: items[index]);
        },
      ),
    );
  }
}
