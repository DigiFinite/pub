import 'package:dro_health_home_task/models/category.dart';

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

  static Future<List<Category>?> fetchAllCategories() {
    // simulates the fetching of categories from the server
    return Future.delayed(
      const Duration(seconds: 10),
      () => categories,
    );
  }
}
