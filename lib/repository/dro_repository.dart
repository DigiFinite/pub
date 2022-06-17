import 'package:dro_health_home_task/models/category.dart';
import 'package:dro_health_home_task/models/product.dart';

class DroRepository {
  // List of hardcorded categories
  static List<Category> categories = [
    Category(
      id: 1,
      title: "Headache",
      imageSource: "assets/images/headache.jpeg",
    ),
    Category(
      id: 2,
      title: "Supplements",
      imageSource: "assets/images/supplements.jpg",
    ),
    Category(
      id: 3,
      title: "Infants",
      imageSource: "assets/images/baby_boy.jpg",
    ),
    Category(
      id: 4,
      title: "Cough",
      imageSource: "assets/images/coughing_guy.webp",
    )
  ];

  // List of products
  static final List<Product> products = [
    Product(
        id: 1,
        name: "Paracetamol",
        type: "Tablet",
        mass: "500",
        price: 350,
        imageSource: "assets/images/emzor_paracetamol.jpeg"),
    Product(
        id: 2,
        name: "Doliprane",
        type: "Capsule",
        mass: "1000",
        price: 350,
        imageSource: "assets/images/doliprane_paracetamol.jpeg"),
    Product(
        id: 3,
        name: "Paracetamol",
        type: "Tablet",
        mass: "500",
        price: 500,
        imageSource: "assets/images/ratiopharm_paracetamol.jpg"),
    Product(
        id: 4,
        name: "Ibuprofen",
        type: "Tablet",
        mass: "200",
        price: 700,
        imageSource: "assets/images/ibuprofen.jpg"),
    Product(
        id: 5,
        name: "Panadol",
        type: "Tablet",
        mass: "500",
        price: 350,
        imageSource: "assets/images/panadol_extra.jpeg"),
    Product(
        id: 6,
        name: "Ibuprofen",
        type: "Tablet",
        mass: "400",
        price: 500,
        imageSource: "assets/images/ibuprofen-2.jpeg"),
    Product(
        id: 6,
        name: "Emzor Paracetamol",
        type: "Syrup",
        mass: "400",
        price: 900,
        imageSource: "assets/images/paracetamol_syrup.png"),
  ];

  /// Fetch call Dro Health Product categories and return them as a future.
  static Future<List<Category>?> fetchAllCategories() {
  // simulates the fetching of categories from the server
    return Future.delayed(
      const Duration(seconds: 3),
      () => categories,
    );
  }

    /// Fetch call Dro Health Products. A Future of products is returned
  static fetchAllProducts() {
  // simulates the fetching of all products from the server
    return Future.delayed(
      const Duration(seconds: 10),
      () => products,
    );
  }
}
