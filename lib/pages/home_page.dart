import 'package:dro_health_home_task/widgets/category_container.dart';
import 'package:dro_health_home_task/widgets/delivery_location.dart';
import 'package:flutter/material.dart';

import 'package:dro_health_home_task/models/category.dart';
import 'package:dro_health_home_task/models/product.dart';
import 'package:dro_health_home_task/utils/dro_colors.dart';
import 'package:dro_health_home_task/widgets/product_card.dart';
import 'package:dro_health_home_task/widgets/search_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          const DeliveryLocationWidget(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "CATEGORIES",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "VIEW ALL",
                          style: TextStyle(
                            color: DroColors.purple,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () => Navigator.of(context).pushNamed('/all_categories')
                      ),
                    ],
                  ),
                  Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: _buildCategoryList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "SUGGESTIONS",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GridView.count(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    childAspectRatio: .67,
                    children: List.generate(
                      products.length,
                      (index) {
                        final drug = products[index];
                        return ProductCard(product: drug);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const HROBottomBar(),
      floatingActionButton: Container(
        width: 150,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            tileMode: TileMode.mirror,
            stops: [0.1, 0.7],
            colors: [
              Color(0xFFFE806F),
              Color(0xFFE5366A),
            ],
          ),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Checkout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "3",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView _buildCategoryList() {
    return ListView.separated(
      shrinkWrap: true,
      // physics: const ClampingScrollPhysics(),
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final Category category = categories[index];
        return CategoryContainer(category: category);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 16,
      ),
      itemCount: categories.length,
    );
  }

  PreferredSize _buildAppBar() {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pharmarcy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Stack(
                    children: [
                      Image.asset("assets/icons/truck.png"),
                      Positioned(
                        top: 0,
                        right: 2,
                        child: Container(
                          height: 7,
                          width: 7,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF2C94C),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              SearchField(
                controller: _controller,
              ),
            ],
          ),
        ),
      ),
      preferredSize: const Size.fromHeight(150),
    );
  }
}

class HROBottomBar extends StatefulWidget {
  const HROBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<HROBottomBar> createState() => _HROBottomBarState();
}

class _HROBottomBarState extends State<HROBottomBar> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      FontAwesomeIcons.house,
      FontAwesomeIcons.userDoctor,
      FontAwesomeIcons.cartPlus,
      FontAwesomeIcons.commentDots,
      FontAwesomeIcons.circleUser,
    ];

    List<String> titles = [
      "Home",
      "Doctors",
      "Pharmacy",
      "Community",
      "Profile",
    ];
    return BottomNavigationBar(
      currentIndex: _selectedPageIndex,
      unselectedItemColor: Colors.grey,
      fixedColor: DroColors.purple,
      elevation: 5,
      showUnselectedLabels: true,
      unselectedLabelStyle: const TextStyle(
        color: Colors.grey,
        fontFamily: "Roboto",
        fontSize: 12,
      ),
      items: List.generate(
        icons.length,
        (index) => BottomNavigationBarItem(
          icon: Icon(icons[index]),
          label: titles[index],
        ),
      ),
      onTap: (index) {
        setState(() {
          _selectedPageIndex = index;
        });
      },
    );
  }
}
