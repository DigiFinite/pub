class Category {
  Category({
    this.id,
    this.title,
    this.imageSource,
  });

  final int? id;
  final String? title;
  final String? imageSource;
}

final List<Category> categories = [
  Category(
    id: 1,
    title: "Headache",
    imageSource: "assets/images/headache.jpeg",
  ),
  Category(
    id: 1,
    title: "Supplements",
    imageSource: "assets/images/supplements.jpg",
  ),
  Category(
    id: 1,
    title: "Infants",
    imageSource: "assets/images/baby_boy.jpg",
  )
];
