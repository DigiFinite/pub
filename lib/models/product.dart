class Product {
  Product({
    this.id,
    this.name,
    this.type,
    this.mass,
    this.price,
    this.imageSource,
  });

  final int? id;
  final String? name;
  final String? type;
  final String? mass;
  final double? price;
  final String? imageSource;
}

final List<Product> products = [
  Product(
    id: 1,
    name: "Paracetamol",
    type: "Tablet",
    mass: "500",
    price: 350,
    imageSource: "assets/images/emzor_paracetamol.jpeg"
  ),
  Product(
    id: 2,
    name: "Doliprane",
    type: "Capsule",
    mass: "1000",
    price: 350,
    imageSource: "assets/images/doliprane_paracetamol.jpeg"
  ),
  Product(
    id: 3,
    name: "Paracetamol",
    type: "Tablet",
    mass: "500",
    price: 500,
    imageSource: "assets/images/ratiopharm_paracetamol.jpg"
  ),
  Product(
    id: 4,
    name: "Ibuprofen",
    type: "Tablet",
    mass: "200",
    price: 700,
    imageSource: "assets/images/ibuprofen.jpg"
  ),
  Product(
    id: 5,
    name: "Panadol",
    type: "Tablet",
    mass: "500",
    price: 350,
    imageSource: "assets/images/panadol_extra.jpeg"
  ),
  Product(
    id: 6,
    name: "Ibuprofen",
    type: "Tablet",
    mass: "400",
    price: 500,
    imageSource: "assets/images/ibuprofen-2.jpeg"
  ),
  Product(
    id: 6,
    name: "Emzor Paracetamol",
    type: "Syrup",
    mass: "400",
    price: 900,
    imageSource: "assets/images/paracetamol_syrup.png"
  ),
];
