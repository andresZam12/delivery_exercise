class Product {
  final String name;
  final String subtitle;
  final String imagePath;
  final double rating;
  final int deliveryMins;
  final String description;
  final double price;

  const Product({
    required this.name,
    required this.subtitle,
    required this.imagePath,
    required this.rating,
    required this.deliveryMins,
    required this.description,
    required this.price,
  });

  static final List<Product> all = [
    Product(
      name: 'Cheeseburger',
      subtitle: "Wendy's Burger",
      imagePath: 'assets/images/burger_wendys.png',
      rating: 4.9,
      deliveryMins: 26,
      description:
          "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
      price: 8.24,
    ),
    Product(
      name: 'Hamburger',
      subtitle: 'Veggie Burger',
      imagePath: 'assets/images/splash_food2.png',
      rating: 4.8,
      deliveryMins: 20,
      description:
          'A delicious veggie burger made with a blend of fresh vegetables and plant-based proteins. Topped with crispy lettuce, tomato, and our special sauce.',
      price: 7.50,
    ),
    Product(
      name: 'Hamburger',
      subtitle: 'Chicken Burger',
      imagePath: 'assets/images/burger_chicken.png',
      rating: 4.6,
      deliveryMins: 22,
      description:
          'A crispy and juicy chicken burger made with a golden-fried chicken fillet, lettuce, tomato, and our signature mayo sauce. A crowd favorite!',
      price: 9.00,
    ),
    Product(
      name: 'Hamburger',
      subtitle: 'Fried Chicken Burger',
      imagePath: 'assets/images/burger_fried_chicken.png',
      rating: 4.5,
      deliveryMins: 30,
      description:
          'Our signature fried chicken burger features a double-fried crispy chicken fillet with coleslaw, pickles and chipotle sauce in a toasted brioche bun.',
      price: 10.50,
    ),
  ];
}
