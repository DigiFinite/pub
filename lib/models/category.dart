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
